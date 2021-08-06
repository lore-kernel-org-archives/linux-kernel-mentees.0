Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F861C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 17:31:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0355B610FC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 17:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0355B610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEFDC60772;
	Fri,  6 Aug 2021 17:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqnKj28PYADH; Fri,  6 Aug 2021 17:31:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 05B786074C;
	Fri,  6 Aug 2021 17:31:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFC76C0010;
	Fri,  6 Aug 2021 17:31:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C11D0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 17:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB7A483B0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 17:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJBPOnfim9Ec
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 17:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EFE283B09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 17:31:52 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id t68so10703100qkf.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7/uX+hHcUSqQz4sU0b+pVOi76kiiqe8WfVDhXonVfco=;
 b=aSwgNxXmZnLQlPxJljBwBRvqsTmXoLRRdeW+mP7V2AQDa4yzHaDnftb3xTiZlqZgRn
 U3O/tYtTnttST2nGUbvu4kKPe8zMNJ1iSenawlX8YxpBYcduiI3cSCpQCURWkYP709Sk
 coG3MaCwKexOL42u213JY9v5xfiZXSp4e7t95BuuZMkQATCOb3PPAGPFhQxVzc5my+oh
 k2ZIvgU9p/OQecLtOBlVAALFB6pKdX38MVJ1h2WQBX2T9Fx4jpwfxiesV2jHYxHmRlW2
 5h1iaXTTRX/mbak5YPi/140x1ezVap4WuNhtafOepPQsLGLjcM50XRiHxERDiI9znc3d
 llSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/uX+hHcUSqQz4sU0b+pVOi76kiiqe8WfVDhXonVfco=;
 b=Uv3La6uezLQp3DSk6XWqqSjZjH95lrlyvw2S4laaW6dofrX0X6JnNupxk+bjLbyIOs
 WCuF1f3eL+6lfVEba+z5sABOpPjdhIart67AGAd/+HWxYBZ4ZRYi1rM/358drD0+EDrY
 RlVGg+rCytI/SxICyiKTzwsz2SM5q/Oh7qTfOMBMpeBm6pSCndnQOyf7ELKWe/kES8fE
 A7+VAj4ugH9atI40Zmlo20i/7TI4WcALAlA1rpIsjlhjB9gBtK+aCkk65bsgge5zAebT
 +mTZZZzJWABfio6z6DixjtzxE1DzyOEGjE3og2b0ivofM/ATq1vFPrY1BCFAcWOO1Ev0
 rmiQ==
X-Gm-Message-State: AOAM533tMjXVHQVuLgiZY5RgjMKWM5zMf2PxDzUyroyK2bDrubhM52si
 xbevk32v/kI5mTQMpRRRyX8/pVMOgGgvr6i5pYo=
X-Google-Smtp-Source: ABdhPJzXUjXCrY1g3DWeAu+h8PUHFWgevKZljLBeT/CtM12aj8tMVP1FpiQJFqN+55AWjREi+OgL+nIdqtfQVckcbes=
X-Received: by 2002:a05:620a:913:: with SMTP id
 v19mr11163147qkv.429.1628271110932; 
 Fri, 06 Aug 2021 10:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210806151841.13940-1-vineshraut2017@gmail.com>
In-Reply-To: <20210806151841.13940-1-vineshraut2017@gmail.com>
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Fri, 6 Aug 2021 23:01:32 +0530
Message-ID: <CAMqN5U4pb9LNvaNe3TCYN=1+kG7JmtfHKavz=Gk+hLO45rAv8Q@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: add UNNECESSARY_CASTS
 message.
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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

On Fri, Aug 6, 2021 at 8:49 PM Vinesh Raut <vineshraut2017@gmail.com> wrote:

>
>      See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
>
> +   **UNNECESSAR_CASTS**
spelling mistake
**UNNECESSARY_CASTS**
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
