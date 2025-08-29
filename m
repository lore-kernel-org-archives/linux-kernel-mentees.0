Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223921D61BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 22:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756506913; cv=none; b=IWo4o26Xf+di9WoZo6QRkpZ+RA8L1zEaUub97adEFlYMibyBxt2Zcr98H8YU2r03ZafChq2dcDaLrv7KgdBHZT7jmhpFElMa5A23QwhvzxDI+qgGMmWlDMGlq8O1YDTEpxkAyMXYeCs7BPmkTTaql9OkbAM52dklzvPv6lleauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756506913; c=relaxed/simple;
	bh=psyHVBHH52umKGRyqGiz9/R/Wx8nDG3Lb6AieVV9h70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oBNZAu0/kDkELOHdlyFWWpHae7iuuiTT7dVD5d3VduPv/KziiJBKt4APTEhhsB+rDSFpPIr9LKkssFuymX6NaJbVg4hyrP5QqZvgtXi8zh1/uU9VYDzRq6d/9igsF/NnUwswt50irg/MY4U6BVLS/H5Wp2/rwaTTPJwBBOhQo/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Yrlg3tWg; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Yrlg3tWg"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD93C41CCA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 22:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsvpZk1-NS-d for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Aug 2025 22:35:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18CF241CC3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CF241CC3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Yrlg3tWg
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 18CF241CC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Aug 2025 22:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D761140AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756506905; bh=j9pdz4fvOvXD/nnfTD03LeIxAJWY+Bl75kULpm1YGrw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yrlg3tWgGl+KR0gvLKPpwxh/ccK70xseariZ3utKekozcfBwJyhS3rBOMTxJP23ir
	 EMxROTR6jAetE6gtkCsaYhqyrB/fzoj5GgUxE8XtdLRMjz/Flaw5kO1GwyGR80pmkL
	 p6yVSUxyBTwDqV9qFOPZPEoAotmDso1RsFWlLiTx5js7McFuKWHfW+kds4t+5bQR2b
	 p0og0yI6Zy73JQ0sbsgW5+XVacq3x6R+tpmfpo5o7uR+Mt33qSImbGkV7VM+M0grkd
	 BH561WzYV19gFCpjoidA/Elib3ZaveH0HOyUV2hJ3CVoTe8Y4Zx6bLMfqbDl+FZBLv
	 dU5mFv0bZeLZA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D761140AF5;
	Fri, 29 Aug 2025 22:35:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Moktar SELLAMI <smokthar925@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, Dave Jiang
 <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gregory Price
 <gourry@gourry.net>, Moktar SELLAMI <smokthar925@gmail.com>, Alok Tiwari
 <alok.a.tiwari@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/driver-api: Fix typo error in cxl
In-Reply-To: <20250819084116.13108-1-smokthar925@gmail.com>
References: <20250819084116.13108-1-smokthar925@gmail.com>
Date: Fri, 29 Aug 2025 16:35:04 -0600
Message-ID: <87iki53gfb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Moktar SELLAMI <smokthar925@gmail.com> writes:

> Fixed Typo in the driver-api/cxl/devices/devices.rst
>
> functionalty -> functionality
>
> Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
> ---
>  Documentation/driver-api/cxl/devices/device-types.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
> index 923f5d89bc04..7f69dfa4509b 100644
> --- a/Documentation/driver-api/cxl/devices/device-types.rst
> +++ b/Documentation/driver-api/cxl/devices/device-types.rst
> @@ -22,7 +22,7 @@ The basic interaction protocol, similar to PCIe configuration mechanisms.
>  Typically used for initialization, configuration, and I/O access for anything
>  other than memory (CXL.mem) or cache (CXL.cache) operations.
>  
> -The Linux CXL driver exposes access to .io functionalty via the various sysfs
> +The Linux CXL driver exposes access to .io functionality via the various sysfs
>  interfaces and /dev/cxl/ devices (which exposes direct access to device
>  mailboxes).

This one was fixed a while back, so this patch is not needed.  It is
always a good idea to check linux-next when considering changes of this
type.

Thanks,

jon
