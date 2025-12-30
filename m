Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6719E7F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Dec 2025 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099092; cv=none; b=embSzAli9dqIDBNVneGM0eJ5hh4oUNw+Z+bTHU2Tf00Zrf/V1LpgHchFCAVwilcHnLzH4XjyYjT9Eld78Uef0Y9mSN/zXuifHd+oF8eVp0SKyH5jyk7LlbGNXBBdzqTKJOtEObuge2GhJ+6iWcOnUMX7RJ/Nh0KZloGQllwOLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099092; c=relaxed/simple;
	bh=pWDH+5NEnkimmrlnsAXZkBHDyve1rIzDnIC5maRNCSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/QRHoYU1K7JswvrArYYJXVU3d7SifMqwdAVNBmai+qmIEpuDuBxBezZTL8R13Rg0NDvc2GPfuhs9C4WY1QxST7BYHkrKnV/9/V3T5bB768xmYhVO8iAeuxUmZvm5DHeZjjUzG1dvVMnZOlo8RpBzEg9+OP42etScbRZt5HpQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pZJoA+5A; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pZJoA+5A"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB7E4019A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Dec 2025 12:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRGpx7TL7_HJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Dec 2025 12:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3114A4013F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3114A4013F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pZJoA+5A
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3114A4013F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Dec 2025 12:51:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A1584333D;
	Tue, 30 Dec 2025 12:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C66C4CEFB;
	Tue, 30 Dec 2025 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767099089;
	bh=pWDH+5NEnkimmrlnsAXZkBHDyve1rIzDnIC5maRNCSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZJoA+5A2Ec1S5averMi/D9E4+MooOZQbfEgP5cbMPvPUlYoncw9casT3OutaO64r
	 QSouSHdE2ZIYuJvg04lUM0ZSPO/NAcuj4cueTd/+4r6ZNEXSQp3HdlD3JhA19dUVns
	 8drVUyDvD739zpdUwHs3colteHsZmz1wew1AfFIo=
Date: Tue, 30 Dec 2025 13:51:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Motti Kumar Babu <mottikumarbabu@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix const array warning
Message-ID: <2025123057-waving-chasing-50e8@gregkh>
References: <20251226120417.2599020-1-mottikumarbabu@gmail.com>
 <2025123055-procurer-prodigal-27b6@gregkh>
 <CAC9bbDKw-TGY81wecEnmhbMror0R=y8McTJGU5CPRf2N8UM9fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC9bbDKw-TGY81wecEnmhbMror0R=y8McTJGU5CPRf2N8UM9fQ@mail.gmail.com>

On Tue, Dec 30, 2025 at 05:42:43PM +0530, Motti Kumar Babu wrote:
> Hi Greg KH,
> 
> Yes, I have verified this change with a test build.
> 
> I ran make defconfig followed by make M=drivers/staging/sm750fb/ on the
> staging-testing branch, and the driver compiled successfully without any
> errors or new warnings.

defconfig will not enable this driver, are you sure you actually built
it?

And please do not top-post, or use html email.

thanks,

greg k-h
