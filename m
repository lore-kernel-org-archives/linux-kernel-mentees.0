Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21ED246BC0
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933621; cv=none; b=Adas0VCKFcRU+hBs5+Bx9cbxYlRj/p0J27D0V4dqbMmuxIJyrH0hpnQ/r2i2iesnwEFKuWWoNVqXCw/vGuXwmuAOZ2D//vVRPJYRedRXF6MBesEBFSMLruAfz+Y8szVwFKICoxRLEKSFnZh4OiHgEHwfp77nKyTICyLq9XOeIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933621; c=relaxed/simple;
	bh=AQVhqHVJ9ACRvEDExYz0CiUVAvSjSdGkKPIAK2tGCxk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JYxCgtcJhMZqQFQNVYV30jn77C0+8GlZ5vGI8la/A4XmoGl2G0TnujlHbLLXwllU4axRpPB/OYoanX7DaOAt2W/AU7vMVYKZqQF587LPkr47vTfnvpg3AsYdnhq19gq3L4wUHgamVpTvx62DCHY5jusqlwewHAlLlBmO3tLFr2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nf0B22pg; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nf0B22pg"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gYxHN1KTJz9tR5;
	Mon,  8 Jun 2026 17:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780933616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQVhqHVJ9ACRvEDExYz0CiUVAvSjSdGkKPIAK2tGCxk=;
	b=nf0B22pgxWw52IJQ3Z82srMPmJv3BLDMfJDaP4rZBVjx2vy5H9/X8r6cBftGm7QnbBTBo3
	HklR00JKJ1ZhkgS6DF9/fZ1Odlj1bJKEBP8GwAMgWtrH/FuZKNoKfXB56Ac5EjhY6eFHQe
	EKgPjJZj+en3iTwaq1yc88re555HM8LDeBanyUsrd82WB8d5iW9Dva2TL2F5y5BmjrjoYX
	R0Kez9d9C/98qCTySizTOM3IH1y6+U3CZwEzmZ5bbim1SuvjkcWMgbBfX1qbpKtXaDLHlV
	OiX6SYUa9Huk7ilOPiJd8bZdqMhGjcI/UeqruZX+ckfG+pd2YKSmKLIcTmNVKQ==
Message-ID: <85761322b578c87381553baf479491a55a5b8b24.camel@mailbox.org>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
From: Manuel Ebner <manuelebner@mailbox.org>
To: Joe Perches <joe@perches.com>, open list <linux-kernel@vger.kernel.org>,
  kernelnewbies <kernelnewbies@kernelnewbies.org>, mentees
 <linux-kernel-mentees@lists.linux.dev>
Date: Mon, 08 Jun 2026 17:46:53 +0200
In-Reply-To: <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
References: <20260608152242.61223-2-manuelebner@mailbox.org>
	 <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: dc066c69450b5261f81
X-MBO-RS-META: kccrqcjdzz16h5dfa1xmen9cz4ojqmmq

On Mon, 2026-06-08 at 08:29 -0700, Joe Perches wrote:
> On Mon, 2026-06-08 at 17:22 +0200, Manuel Ebner wrote:
> > Add all people tagged in all the mentioned commits to the output of thi=
s script.
>=20
> Why?

Because sometimes there is a reason to add them. Doing so with get_maintain=
er
spares the manual copying and pasting.

Thanks
 Manuel
