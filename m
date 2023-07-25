Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083CEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Jul 2023 05:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B79E360A97;
	Tue, 25 Jul 2023 05:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79E360A97
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EvoK59qt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uGrUpFmze_x; Tue, 25 Jul 2023 05:43:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9905560773;
	Tue, 25 Jul 2023 05:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9905560773
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70654C0071;
	Tue, 25 Jul 2023 05:43:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BE8AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 05:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52A71812CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 05:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A71812CE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EvoK59qt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbIJ4TuXGBUm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 05:43:51 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB7BD812C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 05:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB7BD812C1
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b89cfb4571so41274825ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690263831; x=1690868631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sWpeQEXkxx6moDjPwLRjO33o1MVNetkxDTfjChMiebs=;
 b=EvoK59qtrucIfirbBPE8V2OhcYmt3T48AT1joPDN1D9Qu+qEE73r4/cc1daLi60Ydu
 W9OjfU6BEWgE9r5RajS4qZrLP5UQcsIxhFCeTxvvj0fepgYJ05eb82mpkxo5rssbsg9M
 O9LnhOGLbT6aHlqvHX3rkQ44kG3WCtwfmRzCiu7oGkCj07RQcLnNb+pzVNlsMY8zP+Ds
 mmmnbup8yyyj2xJCK7RK0HJ5nRTGUuSj/K4D4w045x0iMMuXZ7Mr3RMJyMpbV6609UYf
 pOMcY58xYhu9AUaZv+QAuzNr1EBwFmXyMcKCqbdXlcHjE3J5mOBlAS+i5o6bXO6qiebk
 Q4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690263831; x=1690868631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWpeQEXkxx6moDjPwLRjO33o1MVNetkxDTfjChMiebs=;
 b=PAm6au4zJCctVcNoIEmee9F+OGoqc+pbMSEVsVMNNaES+myDobt0mQqnj18ZdOGd41
 fd/yK5aL86yV1O6r2bKokE4nKnb5iFueQV60XRamauwxzITk+21kbyz8tsWkoZOVAa5f
 8QCClwNfWeeyqYC1qm4RGCusO94tGTvhQ6w3hsgPuJbgEq89TyOr+5CA9D4YMp9x+yoF
 Y7kkSRzkQEyqNMn6XgoMjCDx7dw0pOZPPaJr0ebyVpFG1e0bRv1b1QiQEK6c4G+yOz1W
 2wTHLQw9UzwzuDh/lcoaif+uYCUyULWsOYPf41Sgc+1/F1GlgloMG3uFAWeflWOTGaSO
 A72Q==
X-Gm-Message-State: ABy/qLZn3RX3NZLkIJ6cAda/xB2OhmkYu/QHJKF01HFY67We3E1IRuxu
 +e42rTI7SwyOBHKZ4Mnv5rI=
X-Google-Smtp-Source: APBJJlH1oBzcBGr7tDO/0eNp6ihGNRlQs70V0KM9UGizlqp6a736sZfqH/REEYad9RTEhLNxX62GsA==
X-Received: by 2002:a17:902:7893:b0:1b9:d961:69b7 with SMTP id
 q19-20020a170902789300b001b9d96169b7mr11745734pll.10.1690263830757; 
 Mon, 24 Jul 2023 22:43:50 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.209])
 by smtp.gmail.com with ESMTPSA id
 jj22-20020a170903049600b001bb54b6c4e4sm9961732plb.147.2023.07.24.22.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 22:43:50 -0700 (PDT)
Date: Tue, 25 Jul 2023 11:13:43 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4
 boards
Message-ID: <ZL9hD2db5xbtpmLu@zephyrusG14>
References: <ZLbATQRjOl09aLAp@zephyrusG14>
 <169022470428.2905604.14514573882052237409.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169022470428.2905604.14514573882052237409.b4-ty@sntech.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
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

Hi Heiko,
On Mon, Jul 24, 2023 at 08:52:37PM +0200, Heiko Stuebner wrote:
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4 boards
>       commit: ebceec271e552a2b05e47d8ef0597052b1a39449
> 
> and added the "Cc: stable@vger.kernel.org"
> 
> Best regards,
> -- 
> Heiko Stuebner <heiko@sntech.de>
Thanks and my heartfelt gratitude to you for fixing and applying the patch. 
I am truly grateful for your support. 

Due to an increased workload and pressing commitments, there is a considerable 
delay in my responses and patch submissions.

Thanks and Regards 
-- Yogesh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
