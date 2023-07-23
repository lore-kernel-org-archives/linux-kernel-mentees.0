Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3ADC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Jul 2023 08:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19B2E40568;
	Sun, 23 Jul 2023 08:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19B2E40568
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aZpe29ck
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIBdXn0DuZo5; Sun, 23 Jul 2023 08:28:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 21DB440168;
	Sun, 23 Jul 2023 08:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21DB440168
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE828C0072;
	Sun, 23 Jul 2023 08:28:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACE14C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 08:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 787D8414A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 08:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787D8414A1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aZpe29ck
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msvW9hBHkkru
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 08:28:43 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7215F410E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 08:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7215F410E7
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b9e93a538dso17580355ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690100923; x=1690705723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f2RBK6a1rrlPMn5TOATq9/7yx1S/Tl+2zZSZzJBZNsM=;
 b=aZpe29ckQMqcjD0CsG2rRtigKYI0ycSzcfnysKME5uEV0dbXxqtgQbq/bhqYWPtf+W
 CSobQNGJyv5uNyH8uuFRqc+5O513SpfChXjITqC+MhD19F9pcuh321hq90epTf2hntZI
 xNJWWUot6UblUHOmHbXg/+aohGhJxd/y12WJLiLVw7Vx4xrYQ+RkRLK3FWeQQFqVSwmi
 9I9HtohJOBSMAaRi0gRLwLmBeMkiYmP6he6Yyl1LTMroJeD73kHNriFDxANu2tsSg2Wy
 F/HCRsLhC2jDUyU/dZPzCQK7fbSeZV8UPDqP3L85G8sLY7tJZ8mUKPFj1Z5xZ9XOIHty
 eGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690100923; x=1690705723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2RBK6a1rrlPMn5TOATq9/7yx1S/Tl+2zZSZzJBZNsM=;
 b=LrMW8mXeqUESzzCoZquYZ59ZHAFOjIIRBQAdqK2QQ7YDMcZ3VoLgQaU59FpC51Bh5A
 Hg8hJvY9d00imabp82QcdGLJO1e5q6TZc72Q0AvZLxfpPm8uZeUs8boRaEUZkCqNtn+D
 u/IKxuVfJqMStiMYsg4rIi2kSwerIO/b/p+cKfJpRZOxrlQbveRuvwA2Lat1PoudNdeT
 PIkhLFmCJ7bK7yhEsjbHm+buEr/YpXu009ytir6Ro5oWT4KY12MYn1IzOmyNSuZjnkRJ
 ORc2qDETavfp+dNzc4Voto6ywVhZ9D1X/U/3uq/ZEldFPGgfdp8ffMhqT+VB1OUvT9i4
 bSPA==
X-Gm-Message-State: ABy/qLaGbtL0lkQCVXTroLam5usgUZljuQhaL26tVbdf5swW0XX/knOk
 qkH0yatNiCSoDbBAWVgYwWI=
X-Google-Smtp-Source: APBJJlEyAivqgS1z/Q7bcfIa339ze+9MNCa6mD2worMXLAUFaSPxd3TpcGx2eH8f/O2vbFPJ05rqIg==
X-Received: by 2002:a17:902:d509:b0:1b9:de67:2870 with SMTP id
 b9-20020a170902d50900b001b9de672870mr6536878plg.40.1690100922731; 
 Sun, 23 Jul 2023 01:28:42 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902ea0a00b001b53d3d8f3dsm6428406plg.299.2023.07.23.01.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 01:28:42 -0700 (PDT)
Date: Sun, 23 Jul 2023 13:58:36 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4
 boards
Message-ID: <ZLzktMnJHTg13Pp/@zephyrusG14>
References: <ZLbATQRjOl09aLAp@zephyrusG14>
 <2023071850-festival-illusion-6399@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023071850-festival-illusion-6399@gregkh>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Jul 18, 2023 at 07:37:21PM +0200, Greg KH wrote:
> On Tue, Jul 18, 2023 at 10:09:41PM +0530, Yogesh Hegde wrote:
> > This patch fixes an issue affecting the Wifi/Bluetooth connectivity on
> > ROCK Pi 4 boards. Commit f471b1b2db08 ("arm64: dts: rockchip: Fix Bluetooth
> > on ROCK Pi 4 boards") introduced a problem with the clock configuration.
> > Specifically, the clock-names property of the sdio-pwrseq node was not
> > updated to 'lpo', causing the driver to wait indefinitely for the wrong clock
> > signal 'ext_clock' instead of the expected one 'lpo'. This prevented the proper
> > initialization of Wifi/Bluetooth chip on ROCK Pi 4 boards.
> > 
> > To address this, this patch updates the clock-names property of the
> > sdio-pwrseq node to "lpo" to align with the changes made to the bluetooth node.
> > 
> > This patch has been tested on ROCK Pi 4B.
> > 
> > Fixes: f471b1b2db08 ("arm64: dts: rockchip: Fix Bluetooth on ROCK Pi 4 boards")
> > Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> 
> Why are you saying this fixes a specific old commit and not also
> properly cc: the stable@vger.kernel.org alias?
It is a mistake on my part. I apologize for the mistake. 
> 
> Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
Thanks for the link, I will read through it and resend a v3 of the patch 
with fixes. 

Thanks and Regards 
-- Yogesh 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
