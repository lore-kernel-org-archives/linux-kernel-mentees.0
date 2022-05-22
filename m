Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D313DC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 May 2022 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6890940472;
	Sun, 22 May 2022 07:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6Q50u_57zTt; Sun, 22 May 2022 07:51:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7148B402E8;
	Sun, 22 May 2022 07:51:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A140C0039;
	Sun, 22 May 2022 07:51:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C24C2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 07:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 982BA41720
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 07:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rurF0jfYJSSe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 07:51:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D0234171A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 07:51:11 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t25so20775280lfg.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=88owq8uKXDsheKyfsbWWUMK1Cxn07lBnqHB3aJaGB1U=;
 b=HVhU/XPrfs70po+5RBr7uTXEFc/VT5WW15xfZyh/B66A+4JMDjApfrPm9LRtsDlVDx
 rn4F21ZXGLeqWNK6TPvES0lJnTpmWCfIDKIIQKrhwl5a5jq+U03iw57s2C+vvGGiEaTa
 K92fGdP1dmnlb2nq/bKbPysPtwIOUuZc0KgZ3pzvbRgmExF722IxMHjeKrj1xbqGKvy0
 OHdyWGfX/JJXBD6AvvCredZcZamJSn5dzrg6726hKyC+yDDqAZxIF1ZnRyWlxgAnF9tA
 x/zX17rGo5nQAgaLZYBoVVJG9yl9byHEjzzdusuHaqplRK85L/MKn+jf/6y7/vBOO7G9
 Q1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=88owq8uKXDsheKyfsbWWUMK1Cxn07lBnqHB3aJaGB1U=;
 b=7eY8nOlJLAg+eGIykUr/1g6I/hxiCOHGUS0o21uOo4dzXV14PV9R7RPFhTCBEe3k1f
 xuGNVJ/zAmGaeBs3PXL/0rJuRo5JX/88IGHEX3PqoCINPEcf8Qh15zoeg5eMaFgUAnOi
 +krF9+KKH+C1b/yHuu/8vJ693lizmXlIcx1sbKZmJd2dFowRyl2QeXQV84V5/H6xk7FE
 PX38GE1caKiYx/IwcEMy2SNoh1N2VZoW/X3a+clId1it1827HMyiTWpZvzdxI4HFV1/P
 PVOai01w0f6azx7uuX4aTRzSiUX3D/OZCtiV5o9I4ySarwm5CrVkEHhf3JgPMG6o4Sto
 C9Lg==
X-Gm-Message-State: AOAM531hj6Pp72hb3bZ2fXREaUtbLqk3R8HQxIlOPg7P27B6/c/1tjeA
 PhNkeHzsfIOkmrYPetrKy9BjLw==
X-Google-Smtp-Source: ABdhPJxn3SFCU7olnoR4mSUevcHXgr6rUAve15/U4XQVAOEFghCkWDWlZk6zSIXXpDyWWLZER5dIUg==
X-Received: by 2002:a05:6512:150a:b0:474:bb9:5174 with SMTP id
 bq10-20020a056512150a00b004740bb95174mr11826565lfb.207.1653205869755; 
 Sun, 22 May 2022 00:51:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 q6-20020ac25286000000b0047255d211c1sm1354476lfm.240.2022.05.22.00.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 00:51:09 -0700 (PDT)
Message-ID: <e15d74d0-2cae-230f-a410-0e1106f490a3@linaro.org>
Date: Sun, 22 May 2022 09:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: mips: Convert plain text file to ReST
Content-Language: en-US
To: Soumya Negi <soumya.negi97@gmail.com>
References: <20220521015613.6197-1-soumya.negi97@gmail.com>
 <7fd80a4b-5e60-0117-b790-359f6d94aeef@linaro.org>
 <20220521202412.GE14144@Negi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521202412.GE14144@Negi>
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 21/05/2022 22:24, Soumya Negi wrote:
> On Sat, May 21, 2022 at 04:25:07PM +0200, Krzysztof Kozlowski wrote:
>> On 21/05/2022 03:56, Soumya Negi wrote:
>>> Converts .txt documentation file to ReST format(.rst).
>>>
>>> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
>>> ---
>>>  .../devicetree/bindings/mips/cpu_irq.rst      | 56 +++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.rst
>>>
>>> diff --git a/Documentation/devicetree/bindings/mips/cpu_irq.rst b/Documentation/devicetree/bindings/mips/cpu_irq.rst
>>> new file mode 100644
>>> index 000000000000..601cc12caa2a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mips/cpu_irq.rst
>>> @@ -0,0 +1,56 @@
>>> +=============================
>>> +MIPS CPU interrupt controller
>>> +=============================
>>> +
>>> +On MIPS the ``mips_cpu_irq_of_init()`` helper can be used to initialize the 8 CPU
>>> +IRQs from a devicetree file and create a ``irq_domain`` for IRQ controller.
>>
>> Bindings is not a place for code. No.
>>
>>> +
>>> +With the ``irq_domain`` in place we can describe how the 8 IRQs are wired to the
>>> +platforms internal interrupt controller cascade.
>>> +
>>> +Below is an example of a platform describing the cascade inside the devicetree
>>> +and the code used to load it inside ``arch_init_irq()``.
>>> +
>>> +Required properties
>>> +-------------------
>>> +* compatible: Should be **"mti,cpu-interrupt-controller"**
>>
>> If you wanted to add bindings, please use DT schema format (see
>> writing-schema, writing-bindings and example-schema files).
> 
> Hi, 
> I don't want to add bindings. I want to the convert the doc file
> Documentation/devicetree/bindings/mips/cpu_irq.txt to ReST file format.
> 
> I referred to this page(https://wiki.linuxfoundation.org/lkmp/lkmp_task_list) while
> creating the patch. It also mentions exceptions that should be kept as plain text 
> files. Does this file count as an exception?


The original file you mention is a dt-bindings file, not a doc file. As
you see it is in the bindings subdirectory. All (or almost all) files in
Documentation/devicetree/bindings are bindings.

It should be stripped out of C code and converted to DT schema (and
moved to interrupt-controllers), not to ReST.

Best regards,
Krzysztof
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
