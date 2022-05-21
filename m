Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDACC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 20:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13F6F40502;
	Sat, 21 May 2022 20:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JypYTwDO702O; Sat, 21 May 2022 20:24:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C585240533;
	Sat, 21 May 2022 20:24:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E5E1C0039;
	Sat, 21 May 2022 20:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0301CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 20:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D46CA60C1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 20:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tQotx32g0QkE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 20:24:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1803E60D94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 20:24:14 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id x143so10416581pfc.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/2ZAUb/3c79LcOEhAzhrL/gplGAmxHvegs+oT3E6170=;
 b=Bp1QoGAeLOyNFbJlvwluZCvsqYA/v8a3UFp7oCy9RK7CtRFTrnLZf5muVW4bsn0vo3
 +azZmvFtF7BvPNiIkq9X4n8JPBGVahcsRN+9AKaYufqzcsMvonHSpVay6/4Wh1bavFiZ
 GvyEheean2KgKTZWQj5UqGIsx0hHgf/5//axfm2PJfNeKSRWywEh3Va09XbgxGhiTKN8
 U5vNsHklenPf9TM3ANj3VUwFI/REu1KW5OEfEVjs640FWdJbpCZ3x05MCxWSWrVjFmPF
 PKrF9lk+NxwgMgiezysgyEbU8xpdDoNNZOPpfq8yYR2iWP8Avx8ERYcV+WJtSTOGKZhx
 BBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/2ZAUb/3c79LcOEhAzhrL/gplGAmxHvegs+oT3E6170=;
 b=qHZt4IAA8N+gpwzttCroly5ke6ehYKcZDCBDg33KZuI8gG6EK9c6dp+4vudNMK9GhM
 lPAuZyU5Yp10acrgZfBqp4n14w1allSWhNIdVrzGuVplymZGBJ1Ej2rR46xuTmzVRKkg
 136xyCl/wai4GYxQZE24Nf9mJEVOwzSRtRHgshrN2lh7qt7wIvU5CY+1Ijrnwr//3E7z
 CG0DchAaORlmw5WT46MEzD2PuATjBtbn/FAdTkfOUCwhz4ksTtaHMXy/47SeFm6+cMCF
 T8aus5WkRm06wFVkfhQtpy3QEgxUgTIi3krY0ExGZawdbZrzmg7nsxV7ur6a1b1Q2cWB
 SeXQ==
X-Gm-Message-State: AOAM532DcsdwBIOpvYoZliXOAvln8Pj39f0ZGkCwIZxIQn8q3cR2qTxe
 EXZeaMJwd/lWl16OCnIHDQA=
X-Google-Smtp-Source: ABdhPJx32VOCtiFkS02kj04P4T3cF2gQ7pXNLVeVkKZ+tgJ1RdKsUS4MpJVxJxafNRrV45tRZgon9w==
X-Received: by 2002:a63:2d8:0:b0:3f9:d9fa:e089 with SMTP id
 207-20020a6302d8000000b003f9d9fae089mr5373293pgc.255.1653164653492; 
 Sat, 21 May 2022 13:24:13 -0700 (PDT)
Received: from Negi ([207.151.52.3]) by smtp.gmail.com with ESMTPSA id
 a7-20020a17090a740700b001d9780b7779sm4102278pjg.15.2022.05.21.13.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 13:24:13 -0700 (PDT)
Date: Sat, 21 May 2022 13:24:12 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: mips: Convert plain text file to ReST
Message-ID: <20220521202412.GE14144@Negi>
References: <20220521015613.6197-1-soumya.negi97@gmail.com>
 <7fd80a4b-5e60-0117-b790-359f6d94aeef@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fd80a4b-5e60-0117-b790-359f6d94aeef@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Sat, May 21, 2022 at 04:25:07PM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2022 03:56, Soumya Negi wrote:
> > Converts .txt documentation file to ReST format(.rst).
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  .../devicetree/bindings/mips/cpu_irq.rst      | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.rst
> > 
> > diff --git a/Documentation/devicetree/bindings/mips/cpu_irq.rst b/Documentation/devicetree/bindings/mips/cpu_irq.rst
> > new file mode 100644
> > index 000000000000..601cc12caa2a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/cpu_irq.rst
> > @@ -0,0 +1,56 @@
> > +=============================
> > +MIPS CPU interrupt controller
> > +=============================
> > +
> > +On MIPS the ``mips_cpu_irq_of_init()`` helper can be used to initialize the 8 CPU
> > +IRQs from a devicetree file and create a ``irq_domain`` for IRQ controller.
> 
> Bindings is not a place for code. No.
> 
> > +
> > +With the ``irq_domain`` in place we can describe how the 8 IRQs are wired to the
> > +platforms internal interrupt controller cascade.
> > +
> > +Below is an example of a platform describing the cascade inside the devicetree
> > +and the code used to load it inside ``arch_init_irq()``.
> > +
> > +Required properties
> > +-------------------
> > +* compatible: Should be **"mti,cpu-interrupt-controller"**
> 
> If you wanted to add bindings, please use DT schema format (see
> writing-schema, writing-bindings and example-schema files).

Hi, 
I don't want to add bindings. I want to the convert the doc file
Documentation/devicetree/bindings/mips/cpu_irq.txt to ReST file format.

I referred to this page(https://wiki.linuxfoundation.org/lkmp/lkmp_task_list) while
creating the patch. It also mentions exceptions that should be kept as plain text 
files. Does this file count as an exception?

Thanks
Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
