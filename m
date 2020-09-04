Return-Path: <SRS0=U0Lt=CN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEE8C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 14:20:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C80A32074A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 14:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBYoU4rt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C80A32074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 964278753F;
	Fri,  4 Sep 2020 14:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsX7wkqezE0f; Fri,  4 Sep 2020 14:20:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E90468753C;
	Fri,  4 Sep 2020 14:20:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D242EC07FF;
	Fri,  4 Sep 2020 14:20:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04280C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E7EA9874BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbbOcJM83mmm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:20:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 58D0C8748A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:20:02 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id o68so4698719pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Sep 2020 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
 bh=ziRdWD2a4BnnqtSJJukJ1YxlKbMI49Wd+41PdYAZpg0=;
 b=LBYoU4rtLuKLZAmx7Z1K59XVFxkoS1eBhypQpQ6OsauCPSrkK7hheVXMppBjGY3VO8
 s2t+iJR23EcR7qtYRS3hxMgiwPaDUCFddMEqKypm7DG0bBwlG44DUEfox3Dkmnd4qpGD
 +ol59w11/WMbTNBRwZeR2t4dN1IfWWbwmK52Lwr22MsDqqMqp2KOs7c57hxTREH7NGZq
 9MW+pb02u+ysgLtea7dJq/zg3jvhi1S/Am9C4N8Mr4MR6weoaOE7ylM69xQvnRrj/2dS
 SMYbNwQCjSGzZmkLdq7angCOPskG8CmZRq+9T6IbiOA+uw1InPf3LWi8fZjh0m3ZJlG1
 MHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ziRdWD2a4BnnqtSJJukJ1YxlKbMI49Wd+41PdYAZpg0=;
 b=Td5oAhkcnkEQgNy+1A8MstEuJj8iPQaH/9A4iSB2g224lMeDqSVENJOK47HZ7cO16E
 csL7D2Jk3VRrcwXhopwc4hrv1m6vM0Vb5i4q/Qf+zwa2ArRRJC/VTfsc7xQZaOx+N92m
 Lcy7oCwWAMO0t77mXGp4LgiTidckQoVTXjFJazUEMsWwNDyTZgkrA/Vq88wJPzbe6Vc5
 40zDWUWz0WLhIPygtClob/gCMD6DOUKj7xvSAPBbHoTF0jOv2yU/SX+FW6hMkKGzF69P
 5CZkK+xZReJh0+vJ6eLMq4nMgUgDthKwtby4g9fGc36VUvIVtrMZhCwvUGP4OvZzAN3Y
 AdmQ==
X-Gm-Message-State: AOAM532vglELcoBl5bx2DV8/MhxSMRsAB0qRMOFrTSHoUshVILhEbaeh
 rLsQP+nekFcWBWV44Qh/6tM=
X-Google-Smtp-Source: ABdhPJxsI6ZpPrXyRqvWyGVHKjEw82PW7+jYTVHXy5hre1quJfbG/NF9hJhTlL0427k4BNgO+mN+hA==
X-Received: by 2002:a62:778c:: with SMTP id s134mr8923587pfc.3.1599229201892; 
 Fri, 04 Sep 2020 07:20:01 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id y7sm6884578pfm.68.2020.09.04.07.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:20:01 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 4 Sep 2020 22:19:54 +0800
To: syzkaller-bugs@googlegroups.com
Message-ID: <20200904141954.uhfxllwykxshtisu@Rk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] How does syzkaller manage to create
 Bluetooth connections in a VM which doesn't have a Bluetooth device
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

I have been trying to fix this issue [1] found by syzbot. I notice the
extracted syzkaller reproducer could connect to another Bluetooth device
successfully because l2cap_chan_connect successfully returns.

// net/Bluetooth/l2cap_sock.c
static int l2cap_sock_connect(struct socket *sock, struct sockaddr *addr,
			      int alen, int flags)
{
	err = l2cap_chan_connect(chan, la.l2_psm, __le16_to_cpu(la.l2_cid),
				 &la.l2_bdaddr, la.l2_bdaddr_type);
}

However, if I use syz-prog2c to convert the syzkaller reproducer to a
C reproducer, the C reproducer could never make a socket connect call
successfully. So how does syzkaller manage to create Bluetooth connections
for the sykaller reproducer? I've understood why this issue [1] occurs
but haven't figured out how it occurs, i.e., what is the subtle race
condition. So I want to write a C reproducer to experiment on it.

[1] INFO: trying to register non-static key in l2cap_chan_del: https://syzkaller.appspot.com/bug?id=aca31fd1ef0cbf898bd37115e2c4c66fa37f4a20

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
