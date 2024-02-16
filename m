Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC338BF0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708061337; cv=none; b=FWkkcif9H0SH47utLgBMjtUl1UK7ysMx7yjUod8H8GBTpii5iXejgHSmGVf29joHL22fHdyL4fRc2x5tHtX8X/imPlImd2+QEP0pD3+uJg2nWRCH9r1/wcoi20Vz3dYPZWZaxFtmetn4xhDjuTvK6nQ7JgUF8Ih9dAQ+6O5KjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708061337; c=relaxed/simple;
	bh=pvjLrBptRgZtu6rGXWEV4j3B7BGqqXBHy2HA9pkezu0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aJfPsh8tWONIsSgi4SzXECAJyzxBAgRm2WW3mQ/azJY39xX+vJLadly7ZvPBPZj+gkaysGaS1ncVBkYKd0MwHgWWfkuhv5jbFegSiAwf4GM2q/zFlljwNHELxsVXFy/RukbN4hyXmdJrziBXSDU5Fo6c9PO4jCUT/nqwaYmaWkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=GhrbqK1s; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="GhrbqK1s"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with UTF8SMTP id D7C6783C5B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 05:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 2.733
X-Spam-Level: **
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with UTF8SMTP id FyfuWjBRzFlP
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 16 Feb 2024 05:28:55 +0000 (UTC)
X-Greylist: delayed 150490 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 16 Feb 2024 05:28:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6C7683C59
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C7683C59
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=GhrbqK1s
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.231; helo=out203-205-221-231.mail.qq.com; envelope-from=ranpark@foxmail.com; receiver=<UNKNOWN> 
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	by smtp1.osuosl.org (Postfix) with UTF8SMTPS id B6C7683C59
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 05:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1708061321;
	bh=Rvc2fug7Uaq7xVmmRaQlwuGeSMbuRAplnzQ8RFybO+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhrbqK1szJ8VTbvxdbksi6G5w4tOXHzbaxynO5HidrB5byIYbRnXphr8UzZK/dKeJ
	 SJ4z2SVwph2a5FZ/8DbcoiXI5ueR9KNsi6hFzOoj6I/ME+zRsDVDQL6qU396ifXeBK
	 /YUEiaNwKxUwqoXY6OEwiWNzS2AN0796Crd+o+sA=
Received: from localhost.localdomain ([139.211.125.72])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 7260DA6F; Fri, 16 Feb 2024 13:28:38 +0800
X-QQ-mid: xmsmtpt1708061318tu8npfz2r
Message-ID: <tencent_B08771190400813E0CC41E36A3F540AACA07@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06iqGy2wE/u1l4Yh6I8YTHfADpjwLTLTNdtTagXHK9S1CpiaKQGqV
	 X2ka1d/1xV3NuSj0A7Axu/50vllF0N5IHM1Pk9JnpQSGxQQ/uBwtFPdMFpqqEfpRAAMFw+29eJuC
	 iHd0xfFb/2QJRpDKM612Rau0c2tB3Zq0LYs8m5fJMwSOF6IWnIrdw8AX5Hwni9E3Gd8UJ+pQrdQW
	 Dou4rV7GIGF28LJTNl1lptFlE+J1r+XJWKAZPrBAwjUW3vX67Jy/ciZO1GE6ncm7GzQk4iaRmjCV
	 cAaWaYu0hf0tYVCadC+UfGxQ31dqz4YhYPPMJzbwq1E91ikMGh5CZybWrRURg5YIiMrV9rEhYUmM
	 eajCSWX9PTqsSXZZRBrHPefFN/HTC2RtusYSrga7EYMZk7Kp+ArbY+5/IZm1H73IvFmCir4Y6m/S
	 wz94oo6vXMoEzXgemay/04Gfrw0wMDL0WLDzPP4xJvAhC8iRBRNPUqa0zhz17s8b2E/lDmfkV6OR
	 OZ21xG/m/KsOCBJMHlBfLdIBK933YlJzvR6bte5c4qg6yunNnxJnIeUgdfHivmpSduU5Fd5fYoSG
	 2eo5QE4RACBClImnGxDlSanZTKMigPpJlT6UmfKCfwYk9/n+0L81ONfsHMKeRtUhMGnkAbmQ03AN
	 ZAkUqLf93aj7uALxuH3HFaJ1V+4y81kCosf2cxVHs48Iawlf6NKd/3zdUne/oPYE7H2XnJAutZIi
	 FUKghMfWwS/dUo/cKcEGUFtPwI2N6NGLC4UeurV7wJg4w/5nrLaYlxp3uZ/p/rVtGmouUHQ4fvZO
	 ambAsVaAW2flHz+mLUqvzrX1H5ec4kWkUeMoWKrLa6mxgrsWaj4LQT3kgsvgD+H6w76ypgg+bSln
	 r6Q/r+E9iJ9NpavZGUZdnELssjAHlKbcOxonFnqnXkeJghGf/VackIeIK047+XinQ+MrxmWdKryi
	 S+LMf9w9hWI0DZ4R07cXTb8SEuK61UJIJoewGHG5nL/TvYWt9gVyt8hM2J1kR/u54ZsXBxNt1Q86
	 e5dOSO/5JIt3y1oBnPOJ6ImuZymuw=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: "Ran.Park" <ranpark@foxmail.com>
To: ricardo@marliere.net
Cc: akinobu.mita@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	ranpark@foxmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Fixed case issue with 'fault-injection' in documentation
Date: Fri, 16 Feb 2024 13:28:38 +0800
X-OQ-MSGID: <20240216052838.4547-1-ranpark@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <piosq44nxwlfeutperrk6d23bx564qlbfirc5xlbouyrunf24r@u6qsgqp47fz6>
References: <piosq44nxwlfeutperrk6d23bx564qlbfirc5xlbouyrunf24r@u6qsgqp47fz6>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for your reply. I'm sorry that I noticed this problem 
while browsing the document. I have not seen any report about this problem 
on lore.kernel.org or other places. Should I mention the situation elsewhere 
and then resend the patch to mention and fix the problem.

