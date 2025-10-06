Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993EA26E6F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750138; cv=none; b=rh5dy3lKeo/q4MQftT70eqoYiS9Tu/XZ1Vlrj2XzAm0pephOnQR830WBBdLIHypldkg809uEjsdzuGJgHK6XJO7YfYcA98OcD2ClNrZJ5s9M+VOwVLqzclDqlPf7ZqE6wEvz937XyZZjpmX6+8mOb3SBFTnE+MSQFIhiWm1yM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750138; c=relaxed/simple;
	bh=eSgpgHXSepwBjz0bnm6+LZCWs3ejEkuQ5USydm4woLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsX93quE3OnF6qmjxscWXRFUhb4z7mIfHCSRh/XLL+vMT7IdZ1Z+pivq9/cAcjDd+BIqfce9psGLXUR2cpGwuRdy3r1yaMy6HNWTDxUCmgkYYmXR9PnQ1E7WNsnLH0T12v7WDJwClTAAaPjOBxZFwvDW/C0owu56eLEJVrdnzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dsopm0Di; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dsopm0Di"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A2983E81
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 11:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pQwWJSAOwPi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Oct 2025 11:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70FC983E56
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FC983E56
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dsopm0Di
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 70FC983E56
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 11:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 812C560440;
	Mon,  6 Oct 2025 11:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42204C4CEF5;
	Mon,  6 Oct 2025 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759750134;
	bh=eSgpgHXSepwBjz0bnm6+LZCWs3ejEkuQ5USydm4woLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dsopm0Di24g3Q7EWbUpP1M7tKuVPD5+ShDEqDyFl1k66dhzGHbj+/YyJJyx8Wv2wY
	 YfK+2rsznhFdZo394WwqIxYavgGsJ9+QRfafbiYp1YYHhL9O0OGLUrt/C5K6YxnyMY
	 njkXLfledH+Fy80h/P66z0AowD8VGSTwqYrfohb8lDguP76Wz4HW3IRxvpWoz4+r2T
	 7rqR8OFa/06d8e+xcshrfRnvXxynVMmGc/sDKZYPeyWKPTTew2FZmAVlULy5OjIyE4
	 S7vy2q+cRvYLmXaibUJzRJfqtbzDIQPKFIedU+aFesEYYsaNi3vqxSK5l4de0/NJ7g
	 F/0qeIst26tdA==
Date: Mon, 6 Oct 2025 13:28:49 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Don Brace <don.brace@microchip.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	storagedev@microchip.com, linux-scsi@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] scsi: Use kmalloc_array to prevent overflow of dynamic
 size calculation
Message-ID: <aOOn8TFTseukaZlS@ryzen>
References: <20251001113935.52596-1-bhanuseshukumar@gmail.com>
 <7761904f64c554821e71e30b205e092fc2f8478e.camel@HansenPartnership.com>
 <1c6cceec-da16-4867-88e0-c629accbb35c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c6cceec-da16-4867-88e0-c629accbb35c@gmail.com>

On Sat, Oct 04, 2025 at 09:55:22AM +0530, Bhanu Seshu Kumar Valluri wrote:
> On 03/10/25 20:23, James Bottomley wrote:
> > On Wed, 2025-10-01 at 17:09 +0530, Bhanu Seshu Kumar Valluri wrote:
> >> Use kmalloc_array to avoid potential overflow during dynamic size
> >> calculation inside kmalloc.
> > 
> > This description isn't correct.
> > 
> > Given this check
> > 
> >>  
> >> -	host_memory_descriptor->host_chunk_virt_address =
> >> kmalloc(sg_count * sizeof(void *), GFP_KERNEL);
> > 
> > How is it possible that this allocation could ever overflow?
> > 
> > If you want to change the description to say using kmalloc_array is
> > better practice or something (and the maintainer concurs) that's fine,
> > but we can't have a false justification in the kernel git log.
> > 
> > Regards,
> > 
> > James
> > 
> Hi,
> 
> Thank you for your helpful comment. 
> I will await till maintainer confirms if it is ok to push this change as v2 with
> subject line similar what you have suggested.

You misinterpreted James' reply ("and the maintainer concurs").

James is one of the two SCSI maintainers, so there is no need to
delay sending a V2.


Kind regards,
Niklas
