Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C562D2381
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759323370; cv=none; b=GRK9FHnrM9fGy8BuM7SmWeKmcNt6IAPcfEXMCIqiV1Yh7fPxJgO9Jnz5cSJ5BSjc7RmYtIL02lj7Msr51T2QNR5wNRWKdq8QetjAl+OY4TLXKfjKb0X7Q86OMyEP/HC/2ZjLpQ0mmFCnXlgepnzOKQgJ66RWA7zeF++QNGphz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759323370; c=relaxed/simple;
	bh=+xKFI45PTF8KSX2ZGwyuj4KX2LtTG6eIIxgMdws5xt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYI0B+ZboFO2Wm0g82vslJn3C+WaS1XECtrosxciz/N5OzPyjz1H/03XDQT0uHkxFXJWoTyMWX2ofz+EkvXdton49xRpe3QW7KCiyqHVschE2ABIGV4nCrom7e6e5RLEDMUy+y/JUXCZYizgyTfAV9CXW0lGRx/uJKs6OhcSaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7XNN/3A; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7XNN/3A"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCEEC40885
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 12:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iutABEKt09Z4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 12:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7420D4026C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7420D4026C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p7XNN/3A
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7420D4026C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 12:56:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AEA241EEF;
	Wed,  1 Oct 2025 12:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6D9C4CEF4;
	Wed,  1 Oct 2025 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759323362;
	bh=+xKFI45PTF8KSX2ZGwyuj4KX2LtTG6eIIxgMdws5xt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7XNN/3AHpMVB9h2F3DVLSlT0qyfSPUop+Cw4EdxwZRM7FJ595D7UVtXKxtSi2KtN
	 gbXkvSar7Fw54Mj9hMAZly03em8BiZ/go8xUoPMmgNqxIE7wHwRBYQMT8shBSKPnri
	 H7vwGYCawNENlxWE3WS7eM1t8BmLh+T3iCAopQYjPelTGOoJ0F34l3IwI5+w4EAckd
	 CCvd1nzepj7GQccjmhl/dbb44/1cbAioHRiL8znGpMpkB8pfXcpWAZzdHWTFbCPANL
	 HjC4eHs8fpaumgq1D77SscpO7R86QFY41ZlWmXS55qAf09bDJdrc1vGmeSY6kqlph+
	 AFb3NToKyZW1w==
Date: Wed, 1 Oct 2025 07:56:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Saravana Kannan <saravanak@google.com>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] of: doc: Fix typo in doc comments.
Message-ID: <175932334236.1150082.9361612973016720820.robh@kernel.org>
References: <20251001085716.45361-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001085716.45361-1-bhanuseshukumar@gmail.com>


On Wed, 01 Oct 2025 14:27:16 +0530, Bhanu Seshu Kumar Valluri wrote:
> synthetized => synthesized
> definied => defined
> sucess => success
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  drivers/of/irq.c     | 2 +-
>  drivers/of/overlay.c | 2 +-
>  include/linux/of.h   | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 

Applied, thanks!

