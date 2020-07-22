Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30FCC4345C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 11:06:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99997207CD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 11:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SW3tnXE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99997207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4DBB58754B;
	Wed, 22 Jul 2020 11:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-RtXPg2ekJV; Wed, 22 Jul 2020 11:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A51D8715D;
	Wed, 22 Jul 2020 11:06:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FAF0C004E;
	Wed, 22 Jul 2020 11:06:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58C7DC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 11:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 549E9864EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 11:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O81Xots9lL9M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 11:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DAEA4864B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 11:06:10 +0000 (UTC)
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E50EA206F5;
 Wed, 22 Jul 2020 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595415970;
 bh=ARlS4N0DZhXw5wn7LbL38sX1R2IWMLKLACGk0leo0Dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SW3tnXE0YH4u8/RbLrHGYITRjEP2OvjI8Y6r+CECWSsE2frVy6FA99gpHQWH8Pnly
 qFBt3bFGb0YqyP/6REGRAhYKRQYAIIGSsoGtSvfAAZl7aE1ymEpns2yL+lZ79QGRz8
 tMyuekCdaBCqC5YSNBCFWMTp6nhDTAIux7ty3m2U=
Date: Wed, 22 Jul 2020 13:06:07 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200722110607.GQ1030@ninjato>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-15-refactormyself@gmail.com>
 <20200717165820.6b5318ad@endymion>
 <44eecce1-7c2d-32c8-865e-e80aa6c3a891@gmail.com>
MIME-Version: 1.0
In-Reply-To: <44eecce1-7c2d-32c8-865e-e80aa6c3a891@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, helgaas@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Jean Delvare <jdelvare@suse.de>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 14/35] i2c/busses: Change
	PCIBIOS_SUCCESSFUL to 0
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
Content-Type: multipart/mixed; boundary="===============5670034123746627025=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============5670034123746627025==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gblAvmLjk8yGG9If"
Content-Disposition: inline


--gblAvmLjk8yGG9If
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sorry about that, lessons learnt.

I'll mark the I2C patches as RFC for me. If you resend them, please
mention if I should pick them or if the series shall go in via some
other tree.


--gblAvmLjk8yGG9If
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YHZ8ACgkQFA3kzBSg
KbaHQA//aXOYFUQm5LQqx3QQs6hscikHJBSVB6obrf87sSLtvV5ouvLY8TGCee6u
cDiLMk+rsy1MEMmnzVCViiRNNn1D0idIGW/FIVvoOx5SPtX8xWr9N1Z8OnXj5IAc
ktdKdMcuOIiDMMbkqyD7PoOweQcaS1bm34KmBvQvWE8fBmjhi19V9zgbhAYSLfw3
/NqpkSIbiLa0sll/mY594RFUtPE+Xx4ruQO/P1z7PqmZ3wg6VAO+vFGYFznIombR
fD9EpfRP5T2M4IeyRoQ/svX18l7/5gnIF/oebMZ7VMe6JJB3PldttuwyPprNw9G7
6oOEz7eJpEEzdGTUpLeZg/bkyrMuq+w0x1kmS5mK8yN6ifJr+LoJxobZnkbK8ML4
nxen3vRmHdG3NDlpiRuTXWj66ynk1Q8MtfXh1juEX3i3xmEdLMYensQtoQKaFQTo
nb3N6PfrgPkVy5OyF0jt5OvBkQJKzqMH2PaTO+8gIg4+Io2fBLSRIKz5EgF3Dqp8
KlmF5sH+Z3PqKtrAavMakYO/0ouzWAbzM7JC8O3B/i+BD444F+i2Hw3fuFpTR0Yw
Wm+iDrUJoKdgyOSUBFASM9bmmvOM0zakfzPCQPFuVEDJAMz2YCvdknaOMDW8Twy9
zZfEblQF9CrzE7wglCe9k+o9BOSKcJ7NnW4Ppp7TqOLiA2Z1q5c=
=uCs9
-----END PGP SIGNATURE-----

--gblAvmLjk8yGG9If--

--===============5670034123746627025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5670034123746627025==--
