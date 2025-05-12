Config = Config or {}

Config.Pets = {
    ['husky'] = {
        model = 1318032802,
        label = "Husky",
        animType = "rottweiler"
    },

    ['rottweiler'] = {
        model = 351016938,
        label = "Rottweiler",
        animType = "rottweiler"
    },

    ['retriever'] = {
        model = 882848737,
        label = "Retriever",
        animType = "rottweiler"
    },

    ['shepherd'] = {
        model = GetHashKey("A_C_shepherd"),
        label = "Schäferhund",
        animType = "rottweiler"
    },

    ['pug'] = {
        model = GetHashKey("a_c_pug"),
        label = "Mops",
        animType = "small"
    },

    ['cat'] = {
        model = GetHashKey("A_C_Cat_01"),
        label = "Katze",
        animType = "cat"
    }
}

Config.Items = {
    ['pet_husky'] = 'husky',
    ['pet_rottweiler'] = 'rottweiler',
    ['pet_retriever'] = 'retriever',
    ['pet_shepherd'] = 'shepherd',
    ['pet_pug'] = 'pug',
    ['pet_cat'] = 'cat'
}

Config.AnimationList = {
    ['rottweiler'] = {
        ['standing'] = {
            ['normal_bark'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_barking@idle_a',
                animationName = 'idle_a'
            },
            ['standing_bark'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_barking@idle_a',
                animationName = 'idle_b'
            },
            ['rotate_bark'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_barking@idle_a',
                animationName = 'idle_c'
            }
        },
        ['sitting'] = {
            ['self_itch'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@idle_a',
                animationName = 'idle_a'
            },
            ['look_around'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@idle_a',
                animationName = 'idle_b',
                skip = { 'A_C_Westy', 'A_C_Pug', 'A_C_Poodle', 'A_C_Cat_01', 'A_C_MtLion', 'A_C_Panther' }
            },
            ['sit_Up'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@idle_a',
                animationName = 'idle_c'
            },
            ['sit'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@base',
                animationName = 'base'
            }
        },
        ['misc'] = {
            ['indicate_ahead'] = {
                animDictionary = 'creatures@rottweiler@indication@',
                animationName = 'indicate_ahead'
            },
            ['indicate_high'] = {
                animDictionary = 'creatures@rottweiler@indication@',
                animationName = 'indicate_high'
            },
            ['indicate_low'] = {
                animDictionary = 'creatures@rottweiler@indication@',
                animationName = 'indicate_low'
            },
            ['play_dead'] = {
                animDictionary = 'creatures@rottweiler@move',
                animationName = 'dying'
            }
        },
        ['tricks'] = {
            ['beg'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'beg_enter'
                    },
                    [2] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'beg_loop'
                    },
                    [3] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'beg_exit'
                    }
                }
            },
            ['paw'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'paw_right_enter'
                    },
                    [2] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'paw_right_loop'
                    },
                    [3] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'paw_right_exit'
                    }
                }
            },
            ['petting_chop'] = {
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'petting_chop'
            },
            ['petting_franklin'] = { -- this is for human that is petting dog!
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'petting_franklin'
            }
        },
        ['hump'] = {
            ['hump_chop'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'creatures@rottweiler@amb@',
                        animationName = 'hump_enter_chop'
                    },
                    [2] = {
                        animDictionary = 'creatures@rottweiler@amb@',
                        animationName = 'hump_loop_chop'
                    },
                    [3] = {
                        animDictionary = 'creatures@rottweiler@amb@',
                        animationName = 'hump_exit_chop'
                    }
                }
            },
            ['hump_ladydog'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'creatures@rottweiler@amb@',
                        animationName = 'hump_enter_ladydog'
                    },
                    [2] = {
                        animDictionary = 'creatures@rottweiler@amb@',
                        animationName = 'hump_loop_ladydog'
                    },
                    [3] = {
                        animDictionary = 'creatures@rottweiler@amb@',
                        animationName = 'hump_exit_ladydog'
                    }
                }
            }

        },
        ['sleep'] = {
            ['exit_kennel'] = {
                animDictionary = 'creatures@rottweiler@amb@sleep_in_kennel@',
                animationName = 'exit_kennel'
            },
            ['sleep_in_kennel'] = {
                animDictionary = 'creatures@rottweiler@amb@sleep_in_kennel@',
                animationName = 'sleep_in_kennel'
            }
        },
        ['pickup'] = {
            ['fetch_drop'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'fetch_drop'
            },
            ['fetch_pickup'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'fetch_pickup'
            }
        },
        ['dump'] = {
            ['dumpi'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'dump_enter'
                    },
                    [2] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'dump_loop'
                    },
                    [3] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'dump_exit'
                    }
                }
            }
        },
        ['pee'] = {
            ['pee'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'pee_left_enter'
                    },
                    [2] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'pee_left_idle'
                    },
                    [3] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'pee_left_exit'
                    }
                }
            }
        }
    },
    ['cat'] = {
        ['standing'] = {
            ['idle'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle'
            },
            ['idle_dwn'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle_dwn'
            },
            ['idle_upp'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle_upp'
            }
        },
        ['sitting'] = {
            ['sit'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ledge@idle_a',
                animationName = 'idle_a'
            }
        },
        ['misc'] = {},
        ['sleep'] = {
            ['enter_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@enter',
                animationName = 'enter'
            },
            ['sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@base',
                animationName = 'base'
            },
            ['idle_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a',
                animationName = 'idle_a'
            },
            ['exit_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@exit',
                animationName = 'base'
            },
            ['exit2_sleep'] = {
                animDictionary = 'creatures@cat@amb@peyote@enter',
                animationName = 'enter'
            },
            ['exit_panic_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@exit',
                animationName = 'idle_a'
            }
        }
    },
    ['cougar'] = {
        ['standing'] = {
            ['idle'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle'
            }
        },
        ['siting'] = {
            ['sitting'] = {
                animDictionary = 'creatures@cougar@amb@world_cougar_rest@idle_a',
                animationName = 'idle_c'
            }
        },
        ['misc'] = {},
        ['sleep'] = {
            ['enter_sleep'] = {
                animDictionary = 'creatures@cougar@amb@world_cougar_rest@idle_a',
                animationName = 'idle_a'
            }

        }
    },
    ['small'] = {
        ['standing'] = {
            ['barking'] = {
                animDictionary = 'creatures@pug@amb@world_dog_barking@idle_a',
                animationName = 'idle_a'
            },
            ['barking_idle'] = {
                animDictionary = 'creatures@pug@amb@world_dog_barking@idle_a',
                animationName = 'idle_b'
            },
            ['self_clean'] = {
                animDictionary = 'creatures@pug@amb@world_dog_barking@idle_a',
                animationName = 'idle_c'
            }
        },
        ['sitting'] = {
            ['siting_1'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'creatures@pug@amb@world_dog_sitting@enter',
                        animationName = 'enter'
                    },
                    [2] = {
                        animDictionary = 'creatures@pug@amb@world_dog_sitting@base',
                        animationName = 'base'
                    },
                    [3] = {
                        animDictionary = 'creatures@pug@amb@world_dog_sitting@exit',
                        animationName = 'exit'
                    }
                }
            },
            ['sitaa'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@idle_a',
                animationName = 'idle_a'
            },
            ['look_around'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@idle_a',
                animationName = 'idle_b'
            },
            ['sit'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@base',
                animationName = 'base'
            }
        },
        ['sleep'] = {}
    },
    ['PLAYER'] = {
        ['revive'] = {
            ['tendtodead'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'amb@medic@standing@tendtodead@enter',
                        animationName = 'enter'
                    },
                    [2] = {
                        animDictionary = 'amb@medic@standing@tendtodead@idle_a',
                        animationName = 'idle_c'
                    },
                    [3] = {
                        animDictionary = 'amb@medic@standing@tendtodead@exit',
                        animationName = 'exit'
                    }
                }
            }
        }
    }
}

function Config.ShowNotification(_type, _message)
    if _type == "error" then
        ESX.ShowError(_message)
    else
        ESX.ShowNotification(_message)
    end
end