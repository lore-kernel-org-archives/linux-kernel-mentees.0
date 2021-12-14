Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32096C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Dec 2021 13:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3760606A0;
	Tue, 14 Dec 2021 13:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7_KxxJHaOl3; Tue, 14 Dec 2021 13:59:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F12B460593;
	Tue, 14 Dec 2021 13:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D008AC002F;
	Tue, 14 Dec 2021 13:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD553C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0BD40476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel-dk.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqFen5Wxa5NI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2CEC40146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:45 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p65so24238318iof.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 05:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=DMsts4DALXAc/4OMVE7nKmsm4oHZCd35/gmAzU5+dTQ=;
 b=lG6LuESlJ4B308I07WHHKuqx5O3r/OW65GXeh4wWWlyyI4EkzBAntlfV9dHOmlEolx
 XaQzKVB/7WyJu3XPVzWIAPfOwvD4PVACuorAykKh2tjfEIF02MFBjXDliLF8086tRBv3
 PrjZsxdgpLZTUoDcU16uFXTSHPMkR3PQ6+XemI3sNIQMaj2yvjlf3WlNOND8X824XtSF
 E9UkZ0jg4ttFL8Xuwj3NHPQA0RP+Xuqa5Kb7UGHH05/nfa/S6XkFefA2llHOf65ioYcv
 3E9BCfx5AmJv1g7/7RsnGo4Z3Iu1HDi2eLlwsQObttiLxJo9a+if8C+bO0YYeTodRAqY
 Dg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=DMsts4DALXAc/4OMVE7nKmsm4oHZCd35/gmAzU5+dTQ=;
 b=laSshs2FA/y0YX6ZjVRsSVf7iFl4J9RbR7y4TbSBbKLYQYPMG+LjGfAEyIIcqtZQL3
 J2QXbATFkiyauz/jzgLnkPpsRnBS677P36DiWWzEvcOWKTBTYcAHuiRuKC2SF5Acut1b
 8cJLekYZ4xml5kJr+HW18O3Cg/Mj0G/gNMKau93vuc1ZPcpk/JtCZg4nhDDCc4Dwn/JG
 9UCnsT4ANvSLCRpF2eNR4I+H3o8jJ/B8HN09GPu6t+H8eoRIgcmn2Yg1WvWJopFs9icL
 xyMEUL6XpTgJJ4ElYsVP1E1WJCZh4Sx8v544flfFKspdQo9hbOR9U38prJTzBUcTa7G1
 QXhQ==
X-Gm-Message-State: AOAM530iEuQdPU/S+wP5a5AkFo+KQT2ODvMWoOYz2eqnBGHK2VyduE9Q
 VaB6eNGRTCJelQ8ZLiGSnG1wog==
X-Google-Smtp-Source: ABdhPJy7KeYpJWVcc6tu3G+V+pMOg2OSAAl9uEPFaXTi58pXfepSftxLmnmO0y0O6J0QGX+ww67z8g==
X-Received: by 2002:a05:6638:348f:: with SMTP id
 t15mr2867875jal.272.1639490384660; 
 Tue, 14 Dec 2021 05:59:44 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id r18sm8793747ilh.59.2021.12.14.05.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 05:59:44 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philip Kelleher <pjk1939@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>
In-Reply-To: <20211208192449.146076-1-helgaas@kernel.org>
References: <20211208192449.146076-1-helgaas@kernel.org>
Subject: Re: [PATCH v5 0/4] block: convert to generic power management
Message-Id: <163949038206.174299.12080416577354381479.b4-ty@kernel.dk>
Date: Tue, 14 Dec 2021 06:59:42 -0700
MIME-Version: 1.0
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
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

On Wed, 8 Dec 2021 13:24:45 -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This is a repost of patches from Vaibhav to convert from legacy PCI power
> management to generic power management.  The most recent posting is here:
> 
>   https://lore.kernel.org/all/20210114115423.52414-1-vaibhavgupta40@gmail.com/
> 
> [...]

Applied, thanks!

[1/4] mtip32xx: remove pointless drvdata checking
      commit: 2920417c98dbe4b58200c12fc9dc152834b76e42
[2/4] mtip32xx: remove pointless drvdata lookups
      commit: 9e541f142dab67264075baaf8fd2eb4423742c16
[3/4] mtip32xx: convert to generic power management
      commit: cd97b7e0d78009b45e08b92441d9562f9f37968c
[4/4] rsxx: Drop PCI legacy power management
      commit: ac6f6548fcb3c6da8ff1653a16c66fc1719a2a3e

Best regards,
-- 
Jens Axboe


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
