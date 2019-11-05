Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC38C5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:20:57 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE0721929
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="GiKYy1JE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE0721929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9187FDB9;
	Tue,  5 Nov 2019 21:20:54 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 24232DB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:20:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from pv50p00im-ztdg10021101.me.com (pv50p00im-ztdg10021101.me.com
	[17.58.6.44])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 95C4C8AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1572988851;
	bh=h3o52br4jvnZB7PffqovMN/wWbQ+sHA0bJXidPQP1Xk=;
	h=Content-Type:From:Date:Subject:Message-Id:To;
	b=GiKYy1JEbce/lnZ6RZODm2d5AEBPtIsFRI9xRu3ha6u/pzDN9I1EEOkmQj8am6Bzo
	Q/cYqkOPhvyeMZfl6nbMgwNc2alZqtRjFmc1evu1BFmyiso9ALUw2UtTcj4GXNKouU
	1qBgzYy4dUwY5VC6ZZ0HNz198VQucls7toPbTU5XXg8B2DMf7GCHi7jTOhLLEjL7qL
	YcQJpBU7HC78QE9/5VEB3fEqgMgM2A0r3q/F3fWLrQFGQUinNdFMcFGdW6iXMOQgca
	2P5GSalk8382PphV1e9BbBAV1OxL/QFlQtMkgz3jJRYY2z2Gp/l7nVDrZ/BrpHZJik
	RGW7iH1zJb5NQ==
Received: from [192.168.1.139] (unknown [103.83.69.19])
	by pv50p00im-ztdg10021101.me.com (Postfix) with ESMTPSA id B11401802E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:20:50 +0000 (UTC)
Mime-Version: 1.0 (1.0)
Date: Wed, 6 Nov 2019 02:50:47 +0530
Message-Id: <9B95B742-6B3B-4C87-A384-B3902D618CFD@icloud.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailer: iPhone Mail (17A878)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-11-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=4 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=4 clxscore=1011 mlxscore=4
	mlxlogscore=140 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1911050173
Subject: [Linux-kernel-mentees] Sending Email to Post in this list
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Mritunjay Sharma via Linux-kernel-mentees
	<linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Mritunjay Sharma <mritunjaysharma394@icloud.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org


Greetings everyone! 

My name is Mritunjay and I am a second year Bachelors student majoring in Computer Science Engineering in India .Here is my email id: mritunjaysharma394@gmail.com to connect with. Thanks ! 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
