Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FDB23F39A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Feb 2025 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740782271; cv=none; b=e3rVXtL6c7BzfhHwBwqf/d4g9fY6/YWKKX4BKr3meBc0Nny8Rmkvc7Mw9VsV+1E8r11CIOJ6hVzRjEJbg6tzQ1addmmlKJ4ZuXf/erBYi1ePpFRiyEYNmy9v1SNEtizeeCUfli0rjSOkMn07Mk+319RTDUrh3BkolrITUj5FHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740782271; c=relaxed/simple;
	bh=nqMKrBalPdNqM1OuUbRe/HDaHwAsfDjsT4mPBPreChU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC0BqG0Wff1EMtI4izdix0I5Y1s9j05xzIPp1XWK2nP1UPVAkKHPQ7wwwzS6kC25JhkrDJ41duPGLU/vNl87+CmhPdqO01XK3upScUly+pjHV62dltJkO00Uw3rXMK23Y2qntuBKYgpgyAGQMiIbxAJykYLt3mVvE5Vouj3Fht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCWAvzRT; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCWAvzRT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6D76FC68
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Feb 2025 22:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.801
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSHPjRpwrc09 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2025 22:31:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 090A072804
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 090A072804
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KCWAvzRT
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 090A072804
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Feb 2025 22:23:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B64175C698B;
	Fri, 28 Feb 2025 22:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB482C4CED6;
	Fri, 28 Feb 2025 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740781431;
	bh=nqMKrBalPdNqM1OuUbRe/HDaHwAsfDjsT4mPBPreChU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCWAvzRToKfvH/cM8ERsZPK9fqVjB6yF3k9HKNoU6xShSoPtwJJMxZz669FKPj0IK
	 hUdUkY4XpuRUJM8nbBA1asogIpSkdt06NcrWbCfkfBX4Hv2FmZ+7cHDzKa5+Fl9Ic4
	 UHyOwKcNQAsobsqpr1gSycgP8od/PxYk282WCfw+HbgaIiIxYm20x0Y6KavFh3Kz/6
	 E9Sj1WwEXU4gQDqL/IfQUADLMbOs2ZQr4I24k4H2CuJsG754TI0NQJDTpK+zzacCZB
	 0Whe6GqV4pvRLBs5Vw9PLUKFAF1t0sLXfMCCLQ55rd1XGvBsMnvY6/5BoYIhGgMpsu
	 y76DXpwculfjg==
Date: Fri, 28 Feb 2025 16:23:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
Cc: vz@mleia.com, skhan@linuxfoundation.org, tglx@linutronix.de,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Convert
 nxp,lpc3220-mic.txt to yaml format
Message-ID: <174078141457.3783766.17433584674723106714.robh@kernel.org>
References: <20250228034021.607135-1-leo.fthirata@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228034021.607135-1-leo.fthirata@gmail.com>


On Fri, 28 Feb 2025 00:39:15 -0300, Leonardo Felipe Takao Hirata wrote:
> Convert NXP LPC3220-MIC to DT schema.
> 
> Signed-off-by: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
> ---
> Changes in v3:
>  - Add interrupts property description
>  - Fix interrupts items descriptions
>  - Remove else condition
> ---
>  .../interrupt-controller/nxp,lpc3220-mic.txt  | 58 ----------------
>  .../interrupt-controller/nxp,lpc3220-mic.yaml | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
> 

Applied, thanks!

