Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F020BC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 21:26:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D2C21741
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 21:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwlX6lG7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D2C21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D31D586EC6;
	Fri, 25 Sep 2020 21:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HROigrbDMnj; Fri, 25 Sep 2020 21:26:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 525F186EC1;
	Fri, 25 Sep 2020 21:26:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 399B9C0859;
	Fri, 25 Sep 2020 21:26:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7880FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6D0F686EC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqC2eJS6+yoy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:26:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 89C4E86EBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:26:02 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 197so3649398pge.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GY+vxiBtiT6nyaykfbpGlgQF0Yl11tccX8gbqu8M5vA=;
 b=VwlX6lG7XeeXLFOzMKri0p24xIv1Zxd44vMVqkyiwVxdTcXypP6EcV8a0xGfweck/b
 lC+9OOY73GFnIrcBt7oaf4fn58w2CImZaeqetfT6El0tpH5bh6NnsxLO5DqMqFMYbjCj
 9WuVp8x2POdn1pyJq9Xfsif8jwyItmWSaDFFBgMxEWyoDT6g38BDFMZ68n+7MdhmV9da
 PtsXIvEkP5pGGi3/ZxjdlhmYYm7/NjXLxkfWP4iBTi9ZU2X/usiIJkol+m1C236n1Ov2
 ZypimFFH1cPo9JsliQWoE5pwAD3f2us2b3O2jM+Sizya/aGmMVhOopYVwO14qMqAE1y+
 Qg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GY+vxiBtiT6nyaykfbpGlgQF0Yl11tccX8gbqu8M5vA=;
 b=C9sJJIuW+AeQtwUGLTvcJxJFa3ltsQMmy61yNPVAw2TQPve651dlVLqJRzz+UHZMUc
 NC1zs1fuIve0d4tqU+JoTg8qvcl3W99zYOZxaG4UISzhwPJ3p5WRtaH8Oaixm/bhE+Q+
 5L0shIdQRXU4G4CyWCP+3ijFuEClA8rZWWliCoKMIDLo5B7HKLiNi/JIy7kzlb2I1s+f
 H8uG63v+u7AEwS1mDwYw7xuhEKmjbxetY1bVPSzMfNRkwtYIL6dW3bbnUCC/DAFGvF5X
 tg2O6HyF1k7Mo+prbyWpnv+mLjtllFe/ivMaO835iZByX4mi4MSvApghxiOhkuyNeQed
 nX5Q==
X-Gm-Message-State: AOAM5320Or/ZGxxrcF6/IfVYNZ7r96nIp5EGvMoqdfF72wMwtAN4pRTv
 BOJft1DaLW1sHNu1C4ErJiNUdYGF3G2RtA==
X-Google-Smtp-Source: ABdhPJzPOaL5JyzKZGJMv+Z9njHndoxSLqp+UZRFqbOTmqQ5+CUoFm6pvI9GL7M+LZUz0FKcz4xZ1w==
X-Received: by 2002:a17:902:b685:b029:d2:1e62:4cbe with SMTP id
 c5-20020a170902b685b02900d21e624cbemr1294890pls.58.1601069161671; 
 Fri, 25 Sep 2020 14:26:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:2085:4633:7001:2dd8:81bf])
 by smtp.gmail.com with ESMTPSA id g32sm2985385pgl.89.2020.09.25.14.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 14:26:00 -0700 (PDT)
To: lukas.bulwahn@gmail.com
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <cabeb5d7-f9c3-7e6d-fa43-03e6ef0dc476@gmail.com>
Date: Sat, 26 Sep 2020 02:55:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters
	when calling scripts
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 26/09/20 2:50 am, Ujjwal Kumar wrote:
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  init/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 91456ac0ef20..9f6ec575e3d1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -30,12 +30,12 @@ config CC_IS_GCC
>  
>  config GCC_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> +	default $(shell,sh $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>  	default 0
>  
>  config LD_VERSION
>  	int
> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> +	default $(shell,$(LD) --version | awk -f $(srctree)/scripts/ld-version.sh)
>  
>  config CC_IS_CLANG
>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> @@ -45,20 +45,20 @@ config LD_IS_LLD
>  
>  config CLANG_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> +	default $(shell,sh $(srctree)/scripts/clang-version.sh $(CC))
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>  
>  config CC_CAN_LINK_STATIC
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>  
>  config CC_HAS_ASM_GOTO
> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> +	def_bool $(success,sh $(srctree)/scripts/gcc-goto.sh $(CC))
>  
>  config CC_HAS_ASM_GOTO_OUTPUT
>  	depends on CC_HAS_ASM_GOTO
> 

To unset the executable bit I ran following command:
for i in $(find -executable -type f); do chmod -x $i; done

One thing that I noticed is, once we initiate a kernel build some 
programs are compiled and removing their executable bit is not desirable.
Even after performing "make clean" some of those programs still persist and 
removing their executable bit fails any further attempt to build the kernel.

For instance, tools/objtool/objtool file. In my case I had a total of 19 
files remaining after performing make clean.


Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
