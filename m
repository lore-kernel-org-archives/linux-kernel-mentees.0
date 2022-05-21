Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E78C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1861784687;
	Sat, 21 May 2022 14:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4othSITuVHBg; Sat, 21 May 2022 14:25:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CB7908464D;
	Sat, 21 May 2022 14:25:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6803C0039;
	Sat, 21 May 2022 14:25:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 699E1C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6489D40B2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQu-eG8hSM-W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:25:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7567F400AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:25:11 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f4so18603028lfu.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IbbNsxWO/m2lPWhlsd3aTys0/Azk77kx0rBYcjjzxrw=;
 b=X7Xpxa/+7lKMnKDnsjZKhJ62fLY3M/Bnlu2oTHf1xVs0aDuL6HaFBRursY1TX571Mz
 CTTvITI8UTOU0bVIRqJzdeoY9tvL74IRnKuafMd0fKQhr9aSrbySUUUfjoGyIaRQ8Bsd
 rq1ehvsn+QNWX8JuMg83bVBb141ynroEuXWJ54qYYeJNfrsA7F4ia7U9kRAVJc63vT8S
 4M8f3yEPO65NtNNJ20uF0+3gHIQXGAHNLaNEEZlWrWLCWQf/zI0YohR609F9v+5+nhJi
 E9Zz7Cp9Fq5GYIbAveb2cQk/sth5VKAI5afZFuEbTy+sHdwhZvLjaJUyOwfHt6o67Z0q
 RxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IbbNsxWO/m2lPWhlsd3aTys0/Azk77kx0rBYcjjzxrw=;
 b=Ywnz2dOTeEaPPJFnoUeooLiU+zDr64u44lMdHC1KLWt3ycnynosV76rJF+BQS67dZJ
 S1r8YW0Mjszdps4iW3ot6OVLouPMOpIXdLFnKxcOYWqK7jKvp7rgi6C5cOyYj+wfyxtw
 3ppgRECUkNaf+5AeouF2YYuJFdganCdCZMbFvWUH4ZvOm89UmNlQ5YGJZORU0KE6MMvu
 zIn0D7hJC6hyckviwEoY8JX2ASDFBkFOm8qIIiOpSOiCHH+efH6uz6fYeCqWNesZ982N
 L26ow49mMEudWKjr/Fd8Val97I0Ai0sbLBD1zw92SA1aYMEAXfq4NUmoRAfYBSa5G4GD
 Rb+g==
X-Gm-Message-State: AOAM53267Py6GNPFQ1Fo29b4jfdNST1qXIFqcBR91Hfsylz0hboYLVEJ
 MSNOQZYV8r2BVjVIXqARhYGJbg==
X-Google-Smtp-Source: ABdhPJxWmFsSb0Vzg1NAnz2GPn7MlkNF023jy6AnGMkyrTd5OmsIHxz8MDigJ2L10kwaol2EYaevwQ==
X-Received: by 2002:a05:6512:c0e:b0:478:5a91:20bb with SMTP id
 z14-20020a0565120c0e00b004785a9120bbmr3982177lfu.587.1653143109161; 
 Sat, 21 May 2022 07:25:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 r26-20020a2e995a000000b0024f3d1daea0sm724179ljj.40.2022.05.21.07.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 07:25:08 -0700 (PDT)
Message-ID: <7fd80a4b-5e60-0117-b790-359f6d94aeef@linaro.org>
Date: Sat, 21 May 2022 16:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: mips: Convert plain text file to ReST
Content-Language: en-US
To: Soumya Negi <soumya.negi97@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220521015613.6197-1-soumya.negi97@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521015613.6197-1-soumya.negi97@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 21/05/2022 03:56, Soumya Negi wrote:
> Converts .txt documentation file to ReST format(.rst).
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  .../devicetree/bindings/mips/cpu_irq.rst      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.rst
> 
> diff --git a/Documentation/devicetree/bindings/mips/cpu_irq.rst b/Documentation/devicetree/bindings/mips/cpu_irq.rst
> new file mode 100644
> index 000000000000..601cc12caa2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cpu_irq.rst
> @@ -0,0 +1,56 @@
> +=============================
> +MIPS CPU interrupt controller
> +=============================
> +
> +On MIPS the ``mips_cpu_irq_of_init()`` helper can be used to initialize the 8 CPU
> +IRQs from a devicetree file and create a ``irq_domain`` for IRQ controller.

Bindings is not a place for code. No.

> +
> +With the ``irq_domain`` in place we can describe how the 8 IRQs are wired to the
> +platforms internal interrupt controller cascade.
> +
> +Below is an example of a platform describing the cascade inside the devicetree
> +and the code used to load it inside ``arch_init_irq()``.
> +
> +Required properties
> +-------------------
> +* compatible: Should be **"mti,cpu-interrupt-controller"**

If you wanted to add bindings, please use DT schema format (see
writing-schema, writing-bindings and example-schema files).


Best regards,
Krzysztof
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
