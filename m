Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F29C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 13:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED43D846A7;
	Sat, 21 May 2022 13:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRPeDb4MngO2; Sat, 21 May 2022 13:25:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AD00E82F4A;
	Sat, 21 May 2022 13:25:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EB7AC0032;
	Sat, 21 May 2022 13:25:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4AC3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 13:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39F982FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 13:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Lnwt9mGfihA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 13:25:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3299B82F4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 13:25:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37EDEB802C6;
 Sat, 21 May 2022 13:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4114C385A9;
 Sat, 21 May 2022 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653139511;
 bh=TtsmzGF2DXoo2HJhpgTVn65C9PXQiFnU4QjU6HdszEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mRp+L4yWy/16jwuYKsHDzlJW3T3v2wAMrT5wDYNqHirJ9svLFu+8IgVTkdyDt29NF
 /wubP5GvBW5e/t+XhRrNZ+dni5xrwGIWpmBSE2MmV3/qh0lAvGErLgF5EfSU0Z4SdY
 VKCRGzkCXx2v56DorRqHqqCQw6T0q8ujH0b/Znc0=
Date: Sat, 21 May 2022 15:25:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Subject: Re: [PATCH] dt-bindings: mips: Convert plain text file to ReST
Message-ID: <YojoMzjahyP+HW4m@kroah.com>
References: <20220521015613.6197-1-soumya.negi97@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220521015613.6197-1-soumya.negi97@gmail.com>
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

On Fri, May 20, 2022 at 06:56:13PM -0700, Soumya Negi wrote:
> Converts .txt documentation file to ReST format(.rst).
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  .../devicetree/bindings/mips/cpu_irq.rst      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.rst

That did not "convert" it merely added the new file.  Where was the old
file?

And does this get added to the build somehow?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
