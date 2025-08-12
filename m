Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F728C02D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032320; cv=none; b=cGL67OBcbJadHwp4NTEnK0nbFKekQWgJmm+hqn5ER94AeoNKkPrvRXl4TPHIQ6UBpuxlql84jGQ2CdL2zEY+iUD/NJ0KGs1CF294+AkYFx1dzJkf2D40n4nJvblxO671wVJ2JYCwrzT+mnBUoTqmrdeJUQMi8ThR3iMvMABYvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032320; c=relaxed/simple;
	bh=jSGnmTYL1hsbSTnKzcjU42qulnFdcN0oc+eOfUzqkm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zl0R++i+BoaIAgAj0kHxzR1iFRzbT51gDue+OLRS2e3Um3CyV1e/9YP2bW/Obtgij/V8545oTHcX2OQ1DRCGmk3Ks2ioIbUu0M2WbfuZhcG6CYL6Sdyu57gBFKzAO9bBGPbG1BVTBoW0kHUGv7LnuHYj9c+SfvXHKhwHhloPZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcPCJ67T; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcPCJ67T"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E8360714
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.392
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLSG3alFlvha for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:58:37 +0000 (UTC)
X-Greylist: delayed 344 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 12 Aug 2025 20:58:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B3D66070B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3D66070B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CcPCJ67T
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tj@kernel.org; receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9B3D66070B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:58:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC10244F2B;
	Tue, 12 Aug 2025 20:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805EAC4CEF0;
	Tue, 12 Aug 2025 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755031972;
	bh=jSGnmTYL1hsbSTnKzcjU42qulnFdcN0oc+eOfUzqkm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CcPCJ67TU3yOHHBcb4fcGnGOl16lKeG7Ej9mgzwgxQAn/jek9aXnvCto12Q0Ax1cs
	 /AMd0i5yrOAoZMuaQtmnSz22zUUAuqHIAtAtyBroVsMdjCOvimbNT+2sOIldsfV8dI
	 iP8PdhqZuH3bQrryUCaOW4jAa9+CYl/yKfQpTwfBXrBy6Uj8Yh/T/wy2F7sIU6bYhf
	 0qprmBtyosvEftwxn56FN3bn+eg1mutp15481cpLkO13pxKXENWJEmVum37BqPAG9p
	 4FY7+3k/k1KEtdJxkvptRSDyzXu5Gh1wAte1UI48I4oNK4XQdfcC6t0d7E8qND5onW
	 rOVTceoiddqLQ==
Date: Tue, 12 Aug 2025 10:52:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 3/9] docs: cgroup: fixed spelling mistakes in
 documentation
Message-ID: <aJupoz5mJ9jjwASY@slm.duckdns.org>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>

On Wed, Aug 13, 2025 at 02:19:46AM +0530, Soham Metha wrote:
> found/fixed the following typo
> 
> - Availablity -> Availability
> 
> in `Documentation/admin-guide/cgroup-v2.rst`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Applied to cgroup/for-6.17-fixes.

Thanks.

-- 
tejun
