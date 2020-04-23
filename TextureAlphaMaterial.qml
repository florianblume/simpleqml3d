import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
    id: root

    parameters: [
        Parameter {
            name: "diffuseTexture"
            value: Texture2D {
                textureImages: [TextureImage {
                        source: "qrc:/man.png"
                    }
                ]
            }
        }
    ]

    effect: Effect {
        id: rootEffect

        techniques: [
            Technique {
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 3
                    minorVersion: 1
                }

                filterKeys: [ FilterKey { name: "renderingStyle"; value: "forward" } ]

                renderPasses: [
                    RenderPass {
                        shaderProgram: ShaderProgram {
                            vertexShaderCode:   loadSource("qrc:/shaders/unlittexture.vert")
                            fragmentShaderCode: loadSource("qrc:/shaders/unlittexture.frag")
                        } 
                        renderStates: [
                            DepthTest {
                                depthFunction: DepthTest.LessOrEqual
                            },
                            NoDepthMask {
                            },
                            BlendEquation {
                                blendFunction: BlendEquation.Add
                            },
                            BlendEquationArguments {
                                sourceRgb: BlendEquationArguments.One
                                destinationRgb: BlendEquationArguments.OneMinusSourceAlpha
                                sourceAlpha: BlendEquationArguments.One
                                destinationAlpha: BlendEquationArguments.OneMinusSourceAlpha
                            }
                        ]
                    }
                ]
            }
        ]
    }

}
