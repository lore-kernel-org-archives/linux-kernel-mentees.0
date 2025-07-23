Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950C25A2C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753285272; cv=none; b=C92PQsSldSOFDVINn1VyxDGKhAm+nL0oXNv3xFaPehPqKagoQNXS/zQnqTYehVO11Pu8Jo9UGwsQHWkWE4cMDmBXnkfQpq468WH0QCkXOHOzINraSQe68ywY5ayKOgLZBfM6sbIqxWNYPCSKDw9nG2JUyy1/peq7oW4x7EHtozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753285272; c=relaxed/simple;
	bh=CsdJOzPPr77jhjs2jpaoBnCP47V2IlP2Sop+mBWXqL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wg4gaS5kFqXE87jvMSze4g0KgnJuLbX6PEEG36wrq8N0L2gcaLuFuPEH9HmiSk1pMdGq/ZMr4P1SPRSDdBB82PbFRF1/iRooBY8Gs4dK9TxZACw2TavosOVgoH6xpmcml9uecsNBSMvV98ZnIyVobMv5NSPy7SRj272oX0lQZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9eJ+Upv; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9eJ+Upv"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E2240AC9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 15:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.492
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q69NnI1sK3kr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jul 2025 15:41:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C583407D0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C583407D0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K9eJ+Upv
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9C583407D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 15:41:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 414FCA4FFDC;
	Wed, 23 Jul 2025 15:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5CBC4CEE7;
	Wed, 23 Jul 2025 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753285267;
	bh=CsdJOzPPr77jhjs2jpaoBnCP47V2IlP2Sop+mBWXqL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K9eJ+UpvZlkpFrqZdempNtoTmDpX2b+qkJwoPc8uyPNIqzI0molk6YEwCTvvfvKYb
	 LHrukBvXzJYd/Mqbpaoc1ZqvKEkRB4ODCxSp9m2SC0NL3jjJOseelZTghaosUGYDVc
	 oIoCH823OUL7MtNShLq7pjFmzJz5rDv3NbrvbAym/d6dho4zctTFgGVCQRJSAERGYR
	 MFaeJvTXsI4QlLcmNe8FrRCBVpM5a/aFanvHmWmNLo+8A0+HOV4gfdU2aC9Xms5qJ/
	 /wQ80UNP7lkIVrpFY4nBIFgHXMNQk25WaFWojHnGN/ZtXoZP3b8oSq9LOEx4r74siZ
	 /i6Bx+k9w2vVg==
Date: Wed, 23 Jul 2025 16:41:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <20250723164100.34e864d6@jic23-huawei>
In-Reply-To: <aID01DxC1Hf2PK0i@smile.fi.intel.com>
References: <20250723141359.11723-1-akbansd@gmail.com>
	<aID01DxC1Hf2PK0i@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Jul 2025 17:42:28 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jul 23, 2025 at 07:43:59PM +0530, Akshay Bansod wrote:
> > Update the sysfs interface for sampling frequency and scale attributes.
> > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> > and recommended for use in sysfs.  
> 
> ...
> 
> >  	fs_table = &hw->settings->fs_table[sensor->id];
> >  	for (i = 0; i < fs_table->fs_len; i++)
> > -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> > -				 fs_table->fs_avl[i].gain);
> > -	buf[len - 1] = '\n';
> > +		len += sysfs_emit_at(buf, len, "0.%09u ",
> > +				     fs_table->fs_avl[i].gain);
> > +
> > +	sysfs_emit_at(buf, len - 1, "\n");  
> 
> Still looks a bit weird (while working).
> 
> >  	return len;  
> 
> I deally we should have a helper doing all this under the hood for plenty of
> the (existing) users in the kernel.

hmm I'm not sure generic is terribly easy and I'd prefer this using the
read_avail callbacks that require the data in an array where ever possible.
Mind you that does the same print at len - 1 as this.  Let's play. 
Completely untested.

	for (i = 0; i < fs_table->fs_len; i++)
		len += sysfs_emit_at(buf, len, "0x%09u%c",
				     fs_table->fs_avl[i].gain,
				     ((i == fs_table->fs_len - 1) ? '\n', ' '));

better?

It's definitely not more readable than the above, but it does avoid the write
to len - 1.

> 
> In any case, I leave this change to others to comment, I don't object pushing
> it in this form, either way len - 1 is simply weird.
> 
> 

