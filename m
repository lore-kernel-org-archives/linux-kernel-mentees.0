Return-Path: <SRS0=i4Xv=ZA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8448CFA372C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Nov 2019 17:11:38 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50510206BA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Nov 2019 17:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4iB2Wyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50510206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0F5D5CC1;
	Fri,  8 Nov 2019 17:11:38 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1280ABA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Nov 2019 17:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 108B08A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Nov 2019 17:11:35 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id e187so5918701qkf.4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 08 Nov 2019 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:subject:mime-version;
	bh=/+oVlJ1eSwrbQ2JKxZUBJrGtH491ePczdxkSN9w/4/g=;
	b=O4iB2WyiCTh7VbOINXmUIqW3bFt/zL8xDiCdKz5FRc2LHRJQP3aD2zdsC9XYkv4jzp
	VebzlFnXViRLcJ161iaoX/H6x4h0FzU7TfJs0ODfqFFNkAkvQ9TDD56KnblA5L4tZqZD
	4W1Bv0eImbi4QcmpwZbqalyBdv8wLOGVDOJ6ZjVgLLFxJ1VxCTeJ1IuSgtGhdEi9PV0F
	MHG7XOlTkZ4AYezEA/kwrzt6FWD9I2UUq341NZ/hECx0n6d9fTKbtG3K122Smljr16Op
	ry86x+BcWUeWThZjQQoWqPJ0JMmBzmfnhTaAhkVA3Ubc8m5cT8q4KYAoBJE6zypQ+o8K
	M9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
	bh=/+oVlJ1eSwrbQ2JKxZUBJrGtH491ePczdxkSN9w/4/g=;
	b=dmhM/Q28nr8JJp8FIWHEuX55Qg623PxQKXIT213+PC9jETyruyBddXU0fK7p8ha/XM
	ApC4c7ZZPHcXOht2wBeDkaYA5Gw63hC37ykVYSb8Pt67XYsLAwSfWNM9DKkCf4SObNCE
	UafBqpdPjlisooFsoKzjCPiWiv+rQV8bZaAksjXEM/YOZmYWwYoGguqvwpFU+Vbk3ZyP
	dGWsG78odByOLkGRGB9RuQP8po1bCQj1z5FlxJtnZNUF1GN1+xwIVTQg8Su6dqYvXXvq
	I/AZeta3A9Uaze9qxF0eUR9bR4Vr8oMhCvFV5YDvv3luhXjEhps1T2lju23htfTYrG5O
	SV5w==
X-Gm-Message-State: APjAAAWuh+zg1BR9TfDwPFOS4oTTZlav3qHAaNFF8y9JUgFeFH+DUt2g
	9TVhMfW4URvOLP6nFMzES76r/HLNsr8ZxA==
X-Google-Smtp-Source: APXvYqyyMc25hUqktXBfUgm68MxX5k+xB0J4//iayLbIh86MAuUBZE3A8IqyABJSjpzVMOWUJ4NXsA==
X-Received: by 2002:a37:9103:: with SMTP id t3mr9778134qkd.318.1573233094729; 
	Fri, 08 Nov 2019 09:11:34 -0800 (PST)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	r36sm3991143qta.27.2019.11.08.09.11.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Nov 2019 09:11:33 -0800 (PST)
Date: Fri, 8 Nov 2019 14:04:21 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
	<linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <759CDA8D-0E44-4E85-8EA9-2E1BAE4F7A1D@getmailspring.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] Not working on Documentation/DMA-API.txt
 anymore. Working on vfat.txt
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
Content-Type: multipart/mixed; boundary="===============2358164615211758612=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

--===============2358164615211758612==
Content-Type: multipart/alternative; boundary="5dc5a015_2b0d9ea_73ba"

--5dc5a015_2b0d9ea_73ba
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everyone!

In my last email I said I'd be working on converting DMA-API.txt to RST. It turns out it had already been converted and the .txt had been left behind in the tree.
After browsing the archives again I could not find previous work on vfat.txt, therefore I am working on that now.
Thank you.
--5dc5a015_2b0d9ea_73ba
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hello everyone=21</div><br><div>In my last email I said I'd be worki=
ng on converting DMA-API.txt to RST. It turns out it had already been con=
verted and the .txt had been left behind in the tree.</div><br><div>After=
 browsing the archives again I could not find previous work on vfat.txt, =
therefore I am working on that now.</div><br><div>Thank you.</div>
--5dc5a015_2b0d9ea_73ba--


--===============2358164615211758612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2358164615211758612==--

