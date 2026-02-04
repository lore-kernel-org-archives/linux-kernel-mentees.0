Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45D3ECBDA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211308; cv=none; b=deat4s/bgdMtAHQBqy33G4tQ3MFPAu37j3j2XOGZfuamitW+8R/bQZj6VOSxrAJrDKImeCQ7l9nbJVKgvhnfuHXfi+fPwz7G6ZZjEQqCXSJb6Jn2+PSWNeKKSuSJath2T2rRZcaJwTweQX0NR6lP0kUxYaAdnbeqDT7j1fc2c5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211308; c=relaxed/simple;
	bh=FbJa/EfsoWacCr2nE38u27Pj2p6ZtB3rKlGers+EhcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+EV+0XL2XkiH1e/lOrSRjIr8ZJhI7n8EYnTDGufOzOPz+Y/xjyws+Uosm1bDdSEUF8EUqt+H2M8JEPX77wxefMPWum9RqLZxmxeZtp2OU2xEzJ5D2YxIFOeqZs8PFkXszR1yDopMvF3Zv8bEivfHLJ/ckRRjBveHHrd0r/mpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUJc1dy1; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUJc1dy1"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF98460C07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxFugWYy6aaV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Feb 2026 13:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2809B60880
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2809B60880
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tUJc1dy1
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2809B60880
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:21:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0263D6012A;
	Wed,  4 Feb 2026 13:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C84C4CEF7;
	Wed,  4 Feb 2026 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770211305;
	bh=FbJa/EfsoWacCr2nE38u27Pj2p6ZtB3rKlGers+EhcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUJc1dy1pbFyPGDaUgShKAvYzeT8PXQS9gnJ8/H61sz7kpGZRpttgHEGQh+HYkLrq
	 mubsTySxFgphynjGPphcXj/ECWF6qbxH09wv2+ebJuZsPSQ0LyY4bDr0jcIO1xOgfw
	 E80JFwGKrzRVWsqVMziXMO2YiDPxC5ly6TtxnrqXxSxbFWvX/s3wGLaT/f05s+oQTn
	 Sf3Q1IR+1Q1bTcKnCbO8mvyI3M8Obtjjy31f7ii+8Ij75v+FBBamehhX9QqlbY43FJ
	 BA84sHawdDBs7gT2rW709jW+Qq0EcOl2d0WK3TnQ/fQ8M7Z7Hxg0di30rjKZ1l6/Aw
	 jbTsnCmyIiE0A==
Date: Wed, 4 Feb 2026 13:21:40 +0000
From: Lee Jones <lee@kernel.org>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] docs: bindings: da9055: fix dead link to codec
 binding
Message-ID: <20260204132140.GC1169221@google.com>
References: <20260126111309.22097-1-sohammetha01@gmail.com>
 <177021120569.1239607.5629414298206360992.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177021120569.1239607.5629414298206360992.b4-ty@kernel.org>

On Wed, 04 Feb 2026, Lee Jones wrote:

> On Mon, 26 Jan 2026 16:43:09 +0530, Soham Metha wrote:
> > The simple audio codec bindings were consolidated into
> > trivial-codec.yaml by commit 4acbfcf11cbe ("ASoC: dt-bindings:
> > consolidate simple audio codec to trivial-codec.yaml").
> > 
> > Update the DA9055 binding documentation to reference the new
> > trivial-codec.yaml location.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] docs: bindings: da9055: fix dead link to codec binding
>       commit: 845776177cf3b75be4e27213425f25dcb630d817

I corrected the subject line for you:

  dt-bindings: mfd: da9055: Fix dead link to codec binding

Please use:

  `git log --oneline -- <subsystem>`

... to figure out expected style in the future.

-- 
Lee Jones [李琼斯]
