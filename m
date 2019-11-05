Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318FCC5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:22:57 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E714421929
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="vGcocuzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E714421929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D22D0D9E;
	Tue,  5 Nov 2019 21:22:56 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EDADDD88
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:22:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
	[17.58.6.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 95EB7844
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1572988975;
	bh=WFw2wmoTDY7ry0IqpFl3sLZgAd9NOgpeItF0nINs3Es=;
	h=Content-Type:From:Date:Subject:Message-Id:To;
	b=vGcocuzZVVHM/JkjKRs0/QwcX3bZQ6sYKTdoZBEAsQSCcrVl/C2WWQ3wT2PYwj9ir
	JmzJivAWQu+YaKQyyRUM5FZjotylPeckeFKvVj0KydTer4Zn+1HfkzsarjOjXbzQNX
	LNxkhyS8jB/pF4KiWJMPcsT4IwwvLKspdoPKc/38zSgFFF64EqljEtcenz4YBAjstw
	cxfv6CjHsmRZZrP4nTboNx400L5FlVpRYQyhwY7KiPtZUQQPCDTJKn+H8zwCpxDofD
	UZPLugDtVMq8fl0tE/ga5cDIc9ZMjRQd7CmLdOUIYDfBZCCIOFL+joWgV/Gvc8XmlZ
	GpJdlw6aYkabQ==
Received: from [192.168.1.139] (unknown [103.83.69.19])
	by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id BE79A800EC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:22:54 +0000 (UTC)
Mime-Version: 1.0 (1.0)
Date: Wed, 6 Nov 2019 02:52:51 +0530
Message-Id: <7D09362F-A2AC-469C-99F9-558FE623DDB4@icloud.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailer: iPhone Mail (17A878)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-11-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
	mlxlogscore=285 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1911050173
Subject: [Linux-kernel-mentees] Sending Email Id to Post in the List
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
Content-Type: multipart/mixed; boundary="===============1997920356389085746=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org


--===============1997920356389085746==
Content-Type: multipart/alternative; boundary=Apple-Mail-3E5F5DE8-21CB-4EE8-8FB1-61D052B639EF
Content-Transfer-Encoding: 7bit


--Apple-Mail-3E5F5DE8-21CB-4EE8-8FB1-61D052B639EF
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Greetings everyone!=20

My name is Mritunjay and I am a second year Bachelors student majoring in Co=
mputer Science Engineering in India .Here is my email id: mritunjaysharma394=
@gmail.com to connect with. Thanks !

--Apple-Mail-3E5F5DE8-21CB-4EE8-8FB1-61D052B639EF
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><span style="-webkit-text-size-adjust: auto;">Greetings everyone!&nbsp;</span><br style="-webkit-text-size-adjust: auto;"><span style="-webkit-text-size-adjust: auto;"></span><br style="-webkit-text-size-adjust: auto;"><span style="-webkit-text-size-adjust: auto;">My name is Mritunjay and I am a second year Bachelors student majoring in Computer Science Engineering in India .Here is my email id:&nbsp;<a href="mailto:mritunjaysharma394@gmail.com" dir="ltr" x-apple-data-detectors="true" x-apple-data-detectors-type="link" x-apple-data-detectors-result="0" style="color: currentcolor;">mritunjaysharma394@gmail.com</a>&nbsp;to connect with. Thanks !</span><div dir="ltr"></div></body></html>
--Apple-Mail-3E5F5DE8-21CB-4EE8-8FB1-61D052B639EF--

--===============1997920356389085746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1997920356389085746==--
