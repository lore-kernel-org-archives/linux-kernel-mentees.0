Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60A131E85A
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934216; cv=none; b=iWkTsNGOmvXd0ezW2PosPHALifI0BvjH0dkHjODilcGLRt/ixRhnob8r8TQMef4f7Bw2g8BoJy/dKYbBvgtDibZcfiEUhF04vHRbLQH0Klamz+9bIA7ynchHn9/x79Zwq4zGuEkBV17LXW3Bc6CkXEwMjkfrm0XdSKbFqHeivv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934216; c=relaxed/simple;
	bh=Cdnhx81qI4L8q6OpQFS1SK+TySNTwxzWLTE6uXQ5MRk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGLVSOhbmdRlqmGHD0RBCBS679JTvanHjOAmmhY2mLv4pDU7BvB5mv/70/qAov+5548SeioYXUUk8Wi52KdRZTSw9UfOqBMltJBkTIRtQ8xZVdhTHyKIRpYRp76CRYCp0UEyT5f5hfvBgcLaoqJK7tUsX9TxLkPLpIXerkdGHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Li2fiEX2; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Li2fiEX2"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gYxVr0LJBz9tnc;
	Mon,  8 Jun 2026 17:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780934212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cdnhx81qI4L8q6OpQFS1SK+TySNTwxzWLTE6uXQ5MRk=;
	b=Li2fiEX29Ai3lZFFBLLz0GVnFH+aJf7+2XakRKktUz6w6p/hwhvHNCYoQHGpRSo4Jc7TvQ
	ICLwLq6gGKFAcHTs4SwXhqKNqTi103jBeVYfm7gWKPa7jmamAsiravaNWhwaY3walHciQ3
	fY7k3aob2loOMdz1J6SDAW8PPljBboUGuGfIkzjDUQe4v5PRIm0FWNcoB9U1K9rzajgVZr
	rXPka7RrCEPtK4pn51BO3sQ803AL9I1aJtYssfHoXIpWKCG9sjSn+Kq56dpWy0q4JR1Qm4
	I7YzM8NA5KkkT/BvTW05v35Ca1RbrdW7rLaZviACHg2sc9CX7BLBo3tDMRlidw==
Message-ID: <b8e834c5e593cef91d7f9a4d4cd1d0b2a1c605e2.camel@mailbox.org>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
From: Manuel Ebner <manuelebner@mailbox.org>
To: Joe Perches <joe@perches.com>, open list <linux-kernel@vger.kernel.org>,
  kernelnewbies <kernelnewbies@kernelnewbies.org>, mentees
 <linux-kernel-mentees@lists.linux.dev>
Date: Mon, 08 Jun 2026 17:56:49 +0200
In-Reply-To: <df0a4e75dc79b874b0e20fc5e153e2a22b2cf9f3.camel@perches.com>
References: <20260608152242.61223-2-manuelebner@mailbox.org>
			 <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
		 <85761322b578c87381553baf479491a55a5b8b24.camel@mailbox.org>
	 <df0a4e75dc79b874b0e20fc5e153e2a22b2cf9f3.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 978eae0b3fd2e8ab6bb
X-MBO-RS-META: x34gq66qbdawtmis3dw5xyo1hyjdrbw9

On Mon, 2026-06-08 at 08:52 -0700, Joe Perches wrote:
> On Mon, 2026-06-08 at 17:46 +0200, Manuel Ebner wrote:
> > On Mon, 2026-06-08 at 08:29 -0700, Joe Perches wrote:
> > On Mon, 2026-06-08 at 17:22 +0200, Manuel Ebner wrote:
> > Add all people tagged in all the mentioned commits to the output of thi=
s script.
> > > Why?
> >=20
> > Because sometimes there is a reason to add them. Doing so with get_main=
tainer
> > spares the manual copying and pasting.
>=20
> Please specify this reason in the changelog.

I will do that in a new version.

> > > >+my $email_mentioned =3D 1;
Is it ok to have this on by default or should I turn it off?

Thanks
 Manuel
