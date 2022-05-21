Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B412C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 19:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1E760692;
	Sat, 21 May 2022 19:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwgDbTKoMnRt; Sat, 21 May 2022 19:56:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ADFF560669;
	Sat, 21 May 2022 19:56:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86986C0032;
	Sat, 21 May 2022 19:56:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D76B1C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 19:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1C0F60692
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 19:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31xBALjrl9jp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 19:56:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A3CA60669
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 19:56:01 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id p8so10384639pfh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pahlxMexkmb3bBQA6Xo5H+RyP2uDtCGR2tGr0pnfrto=;
 b=kxRL2LKA5PWfRzabVz4llBGK5GbU10XVYfiNbyO520sbIzAyhQ0U78eQtYfx+7Db3j
 5KOC0PNvAPjAFefRdWJO6F6rfZEapF1cN++hxtpJI3biY/p62801KDJOW3c0I24zcpsa
 QnUVD0mNSBvaipEYHH+eNe10aO9SI8ef4UJK+84417/lmzTyf/tWNWGTw9mR3VDa6xd0
 +a9B+Wb8TEqRjFoTbP8my7BFu0qMSXy7Z+N6Q1qbCoYr5hGfb8VGaGuTiVwkGEt4mawl
 UN6tzQGPZKgVp1Mmfnquv1M2NHf4Bp0thQv4ZK6E3Z37eYNzc5GLzQBkJ6nCrZWOnp18
 5fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pahlxMexkmb3bBQA6Xo5H+RyP2uDtCGR2tGr0pnfrto=;
 b=o6h3jDgHhO28ucgB95+2VtLNFU33+ORg0e1k+q8FKOZqdi4wsFsgcDue80MtZZcqSe
 320HtKzrndKhjMxmr2HtqEePa2twCZ5SEm5I0WAMnfW08eVOl1jaA7/F12+NAzytFB7g
 F3Z5CgIQQS4eFFnE7xJ1N3AdXa00f9Qe66LljAW8J1X3gFSD7DZ632KsDWrz0NoSMSRl
 kpnH7yqbS6xUXiA+5d0CeI4QokOLQS6vCBJApa/zGZ7mjZFnA8Yko1uB/IPm6aLrXGSA
 GadF18iS7HvC8Obq8YFuDWX7x5gvHgn9aot8e+0wkcaE3pfuJenL9mnBGs2iOx7Ej0GS
 +pTQ==
X-Gm-Message-State: AOAM530wrCg3JiPb9BnFlsnCnX3gYw9EJy9jjULNW6vDXdl2egYDlEo+
 zQfrJM87kpHrMEtYroW02Yw=
X-Google-Smtp-Source: ABdhPJyMsuLlslN40Ir06YGFTs98HuVnqrw63vJ9EHLB9HKkCH/+1VU5nKatOpnEUcsbKh/KwG90SQ==
X-Received: by 2002:a63:d244:0:b0:3f2:5897:99c7 with SMTP id
 t4-20020a63d244000000b003f2589799c7mr13563407pgi.533.1653162960530; 
 Sat, 21 May 2022 12:56:00 -0700 (PDT)
Received: from Negi ([207.151.52.3]) by smtp.gmail.com with ESMTPSA id
 mn2-20020a17090b188200b001df983f9a3dsm4069958pjb.29.2022.05.21.12.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 12:56:00 -0700 (PDT)
Date: Sat, 21 May 2022 12:55:59 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: mips: Convert plain text file to ReST
Message-ID: <20220521195558.GD14144@Negi>
References: <20220521015613.6197-1-soumya.negi97@gmail.com>
 <YojoMzjahyP+HW4m@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YojoMzjahyP+HW4m@kroah.com>
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

On Sat, May 21, 2022 at 03:25:07PM +0200, Greg KH wrote:
> On Fri, May 20, 2022 at 06:56:13PM -0700, Soumya Negi wrote:
> > Converts .txt documentation file to ReST format(.rst).
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  .../devicetree/bindings/mips/cpu_irq.rst      | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.rst
> 
> That did not "convert" it merely added the new file.  Where was the old
> file?

I will correct the patch. The old file is Documentation/devicetree/bindings/mips/cpu_irq.txt 

> And does this get added to the build somehow?

No, I don't think so. When building documentation using make htmldocs, the file
does not show up in the Documentation/output directory. 


Regards
Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
