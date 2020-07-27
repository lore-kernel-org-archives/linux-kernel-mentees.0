Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCCDC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:11:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FEE1206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pesu-pes-edu.20150623.gappssmtp.com header.i=@pesu-pes-edu.20150623.gappssmtp.com header.b="IKv9ZWNl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FEE1206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pesu.pes.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3432885F43;
	Mon, 27 Jul 2020 13:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GB2zYu2ezLlG; Mon, 27 Jul 2020 13:11:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9761E85EB4;
	Mon, 27 Jul 2020 13:11:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86F51C0050;
	Mon, 27 Jul 2020 13:11:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C84FCC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B4AEC203F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIw4wAxWh59w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:11:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 78F49203B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:11:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j20so9037038pfe.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=oo7t1szfhSJG4+lLjDn/55PA1qMXizqbtOUBsQKprnY=;
 b=IKv9ZWNl5oPuF/Hbsm3asfdyP9HaYe/mxICK6RG1SgT3zKAB8sxuQQL1XA8yu6w9Hf
 3Pq/S2N6OUNiVTZ08xBO6q4DLVRRAVoZ5aP9gt9WOjXnnT/CM2iE2UrfCt/DC4tlk7oR
 CfG6rpHa4CGqHzd1LxL+yB/HlTMI/Q1HEBbkKOiVzW5imPXy5wn9GpFwSvBrUoX1g1xG
 B/JswoCbooEL6Gh4E+digCzV7kkJQx2EACZTMIdeUgI0g9GgLJPOVLTU+7PHZ55p8EBx
 1sFah/C5yrzr5WrRhTOYXKBY+2Vv4G093NzoFfUyPEjv4ajGR8UAKc89iZCxyklYygP0
 tLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=oo7t1szfhSJG4+lLjDn/55PA1qMXizqbtOUBsQKprnY=;
 b=BPtVDpVBpKTPrdEKFLqOYw3rVSsTPPoOldcayZusVoxibpG0XCpayNbG0Sa1LfIyIN
 DWruBs8IyaTNx4/TLebcblYkV713xfuovY+JCVvAdntCUy5US93phOkwiIrXtq5rh9bs
 S19y8OZ8FrltkDPNwA6Wd8i+GQHDXCNl+xaA/r86aO74h6ckkw5R3X1cLubSVPrFhUvu
 yEYAirZeDq2Yaka5ZDzjRzFIpA/wU8ftoFbBoDHipTtUaTrWZFg6qY/xonW4Ky1VCCds
 McemQ2ZnbhoUZainaC7gYrK+qRSaJb0ekgT1bdiXhlyjki/Og6i2rw18DAUGNEpdZRSl
 83sg==
X-Gm-Message-State: AOAM531r9ViuyxKY2BeRfUubJ1XQRSTkV4AZc1Qh7ECi1BTv9KSRuzRq
 UTPHvSD6LafueDImk0RVPk7nWg==
X-Google-Smtp-Source: ABdhPJw3tmoN5FqHqeiB17jmvdY/CDjzKTGGE7lx1eCIOSPp2h/rfIYEoROrvCmYE6Y+WAOoODGTig==
X-Received: by 2002:a63:aa42:: with SMTP id x2mr19123351pgo.361.1595855462960; 
 Mon, 27 Jul 2020 06:11:02 -0700 (PDT)
Received: from localhost ([2406:7400:73:7c93:d1f0:826d:1814:b78e])
 by smtp.gmail.com with ESMTPSA id q5sm15251100pfc.130.2020.07.27.06.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:11:01 -0700 (PDT)
Date: Mon, 27 Jul 2020 18:40:57 +0530
From: B K Karthik <bkkarthik@pesu.pes.edu>
To: Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200727131057.7a3of3hhsld4ng5t@pesu.pes.edu>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Subject: [Linux-kernel-mentees] [PATCH] net: tipc: fix general protection
 fault in tipc_conn_delete_sub
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
Content-Type: multipart/mixed; boundary="===============4753072562096844591=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4753072562096844591==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3oporsfwhg5guuw5"
Content-Disposition: inline


--3oporsfwhg5guuw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

fix a general protection fault in tipc_conn_delete_sub
by checking for the existance of con->server.
prevent a null-ptr-deref by returning -EINVAL when
con->server is NULL

general protection fault, probably for non-canonical address 0xdffffc000000=
0014: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000a0-0x00000000000000a7]
CPU: 1 PID: 113 Comm: kworker/u4:3 Not tainted 5.6.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 01/01/2011
Workqueue: tipc_send tipc_conn_send_work
RIP: 0010:tipc_conn_delete_sub+0x54/0x440 net/tipc/topsrv.c:231
Code: 48 c1 ea 03 80 3c 02 00 0f 85 f0 03 00 00 48 b8 00 00 00 00 00 fc ff =
df 48 8b 6b 18 48 8d bd a0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 8=
5 c0 03 00 00 48 c7 c0 34 0b 8a 8a 4c 8b a5 a0 00
RSP: 0018:ffffc900012d7b58 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8880a8269c00 RCX: ffffffff8789ca01
RDX: 0000000000000014 RSI: ffffffff8789a059 RDI: 00000000000000a0
RBP: 0000000000000000 R08: ffff8880a8d88380 R09: fffffbfff18577a8
R10: fffffbfff18577a7 R11: ffffffff8c2bbd3f R12: dffffc0000000000
R13: ffff888093d35a18 R14: ffff8880a8269c00 R15: ffff888093d35a00
FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000076c000 CR3: 000000009441d000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 tipc_conn_send_to_sock+0x380/0x560 net/tipc/topsrv.c:266
 tipc_conn_send_work+0x6f/0x90 net/tipc/topsrv.c:304
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2266
 worker_thread+0x96/0xe20 kernel/workqueue.c:2412
 kthread+0x388/0x470 kernel/kthread.c:268
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 2c161a84be832606 ]---
RIP: 0010:tipc_conn_delete_sub+0x54/0x440 net/tipc/topsrv.c:231
Code: 48 c1 ea 03 80 3c 02 00 0f 85 f0 03 00 00 48 b8 00 00 00 00 00 fc ff =
df 48 8b 6b 18 48 8d bd a0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 8=
5 c0 03 00 00 48 c7 c0 34 0b 8a 8a 4c 8b a5 a0 00
RSP: 0018:ffffc900012d7b58 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8880a8269c00 RCX: ffffffff8789ca01
RDX: 0000000000000014 RSI: ffffffff8789a059 RDI: 00000000000000a0
RBP: 0000000000000000 R08: ffff8880a8d88380 R09: fffffbfff18577a8
R10: fffffbfff18577a7 R11: ffffffff8c2bbd3f R12: dffffc0000000000
R13: ffff888093d35a18 R14: ffff8880a8269c00 R15: ffff888093d35a00
FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020800000 CR3: 0000000091b8e000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Reported-and-tested-by: syzbot+55a38037455d0351efd3@syzkaller.appspotmail.c=
om
Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
---
 net/tipc/topsrv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/tipc/topsrv.c b/net/tipc/topsrv.c
index 1489cfb941d8..6c8d0c6bb112 100644
--- a/net/tipc/topsrv.c
+++ b/net/tipc/topsrv.c
@@ -255,6 +255,9 @@ static void tipc_conn_send_to_sock(struct tipc_conn *co=
n)
 	int count =3D 0;
 	int ret;
=20
+	if (!con->server)
+		return -EINVAL;
+
 	spin_lock_bh(&con->outqueue_lock);
=20
 	while (!list_empty(queue)) {
--=20
2.20.1


--3oporsfwhg5guuw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEIF+jd5Z5uS7xKTfpQZdt+T1HgiEFAl8e0mAACgkQQZdt+T1H
giEigQwAmYk+gOwehagBEv8UhqJ1UqlaZSNxIpHfUVZMZjlUmezkFHWoi1cN0S+Z
XmG8taRygB6MDiT4uZQCWVLWDdcNndlwuha/UGWZ4oQ0G/v1J3yDvDQojPgHelhw
XdMk0bKJGg4LdHDQNkpNTUg5mTm2qKJDEUyiNz0aGL25HuVdF4VZEKY/DT8p6h70
fistXiV6ADjEea4YvY1ieJbPCXQoMENeCnMToIjPEdunWCetdLYDp9TCM3NNBpH/
dXw2lAeijrcJVqJnGmxlF8VrGRudYKPDWLZixT4YnWX7Il/5z2fw9GUViODBJqly
+4B0+2920zila3hgLP2EL65+kbz4SdhaPj1mVw0cfF6t8Nfty9eqfiQybZKjnfJp
B5LStWwJxngeHLgk1MUGYu/fsE/EdtkkmSximCPkJnRIw/E6eVwc4F7GwWVc2yxr
aIIgaJwQxnhfuMUIrDSVvvfN37IlYaEFcIb3GLkn6qutUPLCyimr2idkLLu9I1DU
1qFtJL9z
=rv8l
-----END PGP SIGNATURE-----

--3oporsfwhg5guuw5--

--===============4753072562096844591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4753072562096844591==--
