Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD7AC32772
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Aug 2022 16:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48AB0408F8;
	Tue, 23 Aug 2022 16:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48AB0408F8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gnd+uSIE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgkrbsUtHEOJ; Tue, 23 Aug 2022 16:16:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5B853408CA;
	Tue, 23 Aug 2022 16:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B853408CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39C1BC0032;
	Tue, 23 Aug 2022 16:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0121BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C336E60593
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C336E60593
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel-dk.20210112.gappssmtp.com
 header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gnd+uSIE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44h_MrUURiZa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:16:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8735B600CB
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8735B600CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:16:48 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id q81so3680663iod.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc;
 bh=FfGb2wigYjFI5ciFl9OH1jPsygAhh+SORQgeVQ9bFzo=;
 b=gnd+uSIEHxALxFyh8A3GGfp997Qazd+/W0jHV3iRaLnXtBS5dR3S1g/zhFVdtDtpid
 wyVthm35Yf8bGYUMv6e4UKU7/8TuGo/k8TXj4ztio2AbGDkusFZoWpmf5ACsiT8GSSYd
 b8kMuG4Mxq97q1wOoLzDa5IXtQT0Tnen2rw6JLsuMAKrrikw52b8fDvmORwi6IvePNp7
 IJQEUH/eqF04gDUnsWcrD+E7jKqhuNHPPvE6tNEZIn1yHdUZG6Htatnbx3N7PTRiOQh2
 Ov1LPHzZ5JTVbKjolZGE3Q0VgpvvsVsooiLdii+iyVckbgB3EYSWhhuhX9Mhc0wXGzN6
 4TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FfGb2wigYjFI5ciFl9OH1jPsygAhh+SORQgeVQ9bFzo=;
 b=ExqF8vcpz0zikJwzrKnlq7ef+tkF9jbqeFrYbxmTFzsl/S1lNfMhwW6E2+df+YIeSX
 SMxlW8WChKJN+oJDbVdq/40xmubtMN8BA488ahg0ElWlsOUkoqn44vySEq+9/nTg5GyN
 zDvRNVYw3wYgjl9BXjnXxF+j5IcWjG4hN6Kmlf1EUwx1vO55lYHF6766EpmSeVvaYTgU
 BcgW4JGdlfvXIHDpvLBQXmlle8qaaTiKBt5dsMBw0e4WbrUWKUVSSZd0DJndLdGXJSvO
 uT3pVsLcxiUk3GC6R4TiLIq2wngtDH1afM4gAtkUmYD+ScfoXgEHuShhxY0jIxNZTewE
 4gAg==
X-Gm-Message-State: ACgBeo3ryh5xsGMV4xG58infPTqkeQ9BEM179jleSUO1N3fUJY+RBbyx
 bSKDax2hSxBfrGMUInRk/qv9Ww==
X-Google-Smtp-Source: AA6agR6uQip3RJlf9k2Cqr7uH0RT3UsbNmo6RMeNckSsbZdah2DIcYdO7CxQK5sE1I190+W0nLbuHA==
X-Received: by 2002:a05:6602:2f03:b0:678:9c7c:97a5 with SMTP id
 q3-20020a0566022f0300b006789c7c97a5mr11206025iow.32.1661271407112; 
 Tue, 23 Aug 2022 09:16:47 -0700 (PDT)
Received: from [127.0.0.1] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a02a004000000b00349ba0d1137sm4588633jah.24.2022.08.23.09.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 09:16:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20220823160810.181275-1-code@siddh.me>
References: <20220823160810.181275-1-code@siddh.me>
Subject: Re: [PATCH v2] loop: Check for overflow while configuring loop
Message-Id: <166127140632.124225.483036207879834754.b4-ty@kernel.dk>
Date: Tue, 23 Aug 2022 10:16:46 -0600
MIME-Version: 1.0
Cc: hch@infradead.org, syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-block@vger.kernel.org,
 stable@vger.kernel.org
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

On Tue, 23 Aug 2022 21:38:10 +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> The userspace can configure a loop using an ioctl call, wherein
> a configuration of type loop_config is passed (see lo_ioctl()'s
> case on line 1550 of drivers/block/loop.c). This proceeds to call
> loop_configure() which in turn calls loop_set_status_from_info()
> (see line 1050 of loop.c), passing &config->info which is of type
> loop_info64*. This function then sets the appropriate values, like
> the offset.
> 
> [...]

Applied, thanks!

[1/1] loop: Check for overflow while configuring loop
      commit: f11ebc7347340d291ba032a3872e40d3283fc351

Best regards,
-- 
Jens Axboe


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
