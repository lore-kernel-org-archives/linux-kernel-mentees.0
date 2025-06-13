Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBD1537DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823752; cv=none; b=DPfl+C6gIbqvsoDmdFHIiK5U7QSwItjwv32oBkdxlCxSVxU4c4DUYUJ3ny9dZc7dE+Qege8/cDHYbLaX/aEMx1BAdVgreRndfh1vf5M+JrBYK84uyAvO5qRLuzsuWHjBq0FwVTRbeHanfepUANzITYL0SSs8lTensEYdzXUBEjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823752; c=relaxed/simple;
	bh=rN13i6uX9Tda48tVL2/d337AgdSvjSDq0H6D8nntIyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoyTKK96amuVFx5qNby5rffRuErLnXhOxSH8OFyqhhC5N4boeJbaI9L72gkVxFNjoA/i2bmMFL88cQCLbF34vkliHscT+L1Swgt7W9XjVkDKC4+DE5yEnhRa2adYD2idbUcdD+5ePsiplc42o7VzwTbS9QQk07ep6d8h5gDgkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIGMuUOB; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIGMuUOB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D30184340
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aILC042GQrwO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Jun 2025 14:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20FB08433E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FB08433E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OIGMuUOB
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 20FB08433E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:09:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3723062A01;
	Fri, 13 Jun 2025 14:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545A3C4CEE3;
	Fri, 13 Jun 2025 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823748;
	bh=rN13i6uX9Tda48tVL2/d337AgdSvjSDq0H6D8nntIyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIGMuUOBf+pcW7thjZ5Dfg1x0hbPwuQ1BYVWJEbVXmV3uHD8gCZUEScKCiZJ3mfsj
	 7+jBHUxlNLiO9h6XZIFP7x24hlIYVuGMzOYD3RBABgRxU9Sf97MOkVMP1YO43oX/v5
	 FoF6PQCCY+8ilZvqQvcyoiiQsgC+GzlAxUbi9c401iVxdQv632Xa+PMkTnHRBhkoUq
	 hsTdW2qKR2KsYIW0c7rQgoVr1w9t4p9BvpH8CFY97Q7Dg7qfPieZYZxA/U0zdDrNT0
	 1swFVAQgt613Lv2Q7+Mlop7bBAiYmqYnnaVQKHRM8CdeXJATaQy2gTklCl9bcNTdwX
	 5AzNPjnq6+w0g==
Date: Fri, 13 Jun 2025 16:09:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v4 3/3] rust: revocable: split revoke_internal into
 revoke and revoke_nosync
Message-ID: <aEwxAPZSOFdUpFeo@pollux>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-4-marcelomoreira1905@gmail.com>
 <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>

On Thu, Jun 12, 2025 at 11:06:56AM +0200, Benno Lossin wrote:
> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> > This commit refactors the revocation mechanism by removing the generic
> > `revoke_internal` function. Its logic is now directly integrated into
> > two distinct public functions: `revoke()` and `revoke_nosync()`.
> >
> > `revoke_nosync()` is an `unsafe` function that requires the caller to
> > guarantee no concurrent users, thus avoiding an RCU grace period.
> > `revoke()` is a safe function that internally waits for the RCU grace
> > period to ensure all concurrent accesses have completed before dropping
> > the wrapped object.
> >
> > This change improves API clarity and simplifies associated `SAFETY`
> > comments by making the synchronization behavior explicit in the function
> > signatures.
> >
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> 
> One comment below, with that fixed:
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
