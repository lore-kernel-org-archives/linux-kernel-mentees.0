Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3901AC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 19:02:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0851A205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 19:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUaWxfjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0851A205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BFAE986D79;
	Tue,  3 Dec 2019 19:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gccdSZXqbnkF; Tue,  3 Dec 2019 19:02:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 733CE86D6F;
	Tue,  3 Dec 2019 19:02:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5482AC1799;
	Tue,  3 Dec 2019 19:02:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4D77C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 19:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B8C3886D6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 19:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4geIDrXqWFSh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 19:02:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 64C2F86D5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 19:02:38 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id z21so1859730pjq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Dec 2019 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L5H4Xe75fl+vzycgJu0P2w0Qk1+hy9/ufFjW3O7EOe8=;
 b=FUaWxfjRZzMNPXx5aGskvrQgah0dYPjCMcD6w48G5E6JvzAkzZwE3LXRb/OPcbKmum
 kHXQr3lH6nVo29v4ImbHkQi72gIsMVeU1XhPgfxIwpaJz6lX3vvozTRAS9njfml+kz6v
 IjvISWrzcrTGjnrkqS7QlXPZLaJomDPBTuGrKoreP0xuE/kUdWDXgiI83zmxkr3yV4Qi
 7dUoG3cyLKu4e9rlsiI4COOdImoiRypOyH/IzYURIfdx/JAn1DPxTMUG7PjfrYyvP1ZD
 arQqlV4Eeh9Pnr+VrWPEVQBPntqg0GbfYw0cwm1EBuAyqQ4CJLHBVJicS9qcArVvIUvW
 tYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L5H4Xe75fl+vzycgJu0P2w0Qk1+hy9/ufFjW3O7EOe8=;
 b=mp34Vx9KnGvopekWizPldTcDaTtCF6YWyvEgsQPaZ4AcTFRUHMBW7cfnRlMDI9OMMk
 3Wv/PKxo1loVlFjE0f0XtgSK78nImhrs1Y+ip5He7HGYoPdEKF9cQXf/w9DoOZftJo48
 JfHaoRjSVrzDs61zyrqpVMKW2R2xjVU7uxhLaeFYjvxbElmECNCntts4BQEPtk74BQLk
 JcyEVaEMJ411qfbv6F6tEISeFGN00nEGKqSUptpGyHmO8KUI6psuSH8oxgHnata0oz9E
 Y9M3gZ49O/b5/lHUYvAhnwt84NJD7qha/QspRZuwDBmYBPhN0BBbFa6DtLEcmt7eLp9f
 So/A==
X-Gm-Message-State: APjAAAXcZ6Xs6bgaxVbTrIQYugnJ2w+H6O3hAyDpXXHgeyXZ3HixuIWN
 VVSpQErm4Sj0j7dTdNHsBd0=
X-Google-Smtp-Source: APXvYqyatPNZE5cDSuG/iaD7zda/2EC1IqEoXRyMU1zAcq5XradY7m6Yqa4xdK/h0fPlQy0Nsk5A/w==
X-Received: by 2002:a17:902:bf47:: with SMTP id
 u7mr6483128pls.259.1575399757662; 
 Tue, 03 Dec 2019 11:02:37 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:13a5:68f8:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 r3sm4915687pfg.145.2019.12.03.11.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 11:02:37 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: gregkh@linuxfoundation.org
Date: Wed,  4 Dec 2019 00:32:32 +0530
Message-Id: <20191203190232.7816-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203063521.GA1771875@kroah.com>
References: <20191203063521.GA1771875@kroah.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Boot Test: Linux 5.4.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

No, it is not new, I boot tested Linux 5.4.0 and Linux 5.3.1 as well.
I got the same error:

[    0.275651] platform MSFT0101:00: failed to claim resource 1: [mem 0xfed40000-0xfed40fff]
[    0.275657] acpi MSFT0101:00: platform device creation failed: -16

Thank you

Regards,
Madhuparna
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
