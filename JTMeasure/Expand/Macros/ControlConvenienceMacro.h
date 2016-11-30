//
//  ControlConvenienceMacro.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#ifndef ControlConvenienceMacro_h
#define ControlConvenienceMacro_h

//创建label
#define CCLabelCreate(frame, text, textColor, bgColor, font, alignment) \
                        [UILabel createLabelWithFrame:frame\
                        andText:text\
                        andTextColor:textColor\
                        andBgColor:bgColor\
                        andFont:font\
                        andTextAlignment:alignment]

//创建button
#define CCButtonCreate(buttonType, frame, title, font, titleColor, bgColor) \
                        [UIButton createButtonWithButtonType:buttonType \
                        andFrame:frame \
                        andTitle:title \
                        andFont:font \
                        andTitleColor:titleColor \
                andBackgroundColor:bgColor]

//创建textFiled
#define CCTextFiledCreate(frame, placeholder, alignment, font, textColor) \
                            [UITextFiled createTextFieldWithFrame:frame\
                            andPlaceholder:placeholder\
                            andTextAlignment:alignment\
                            andFontSize:font\
                            andTextColor:textColor]\

#endif /* ControlConvenienceMacro_h */
