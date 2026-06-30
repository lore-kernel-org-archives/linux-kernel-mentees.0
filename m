Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341663672AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jun 2026 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786832; cv=none; b=qJBNBM4F3zMXKZLDR2zI0jO5mLWfIWB5exZOWGZC3aWYT+zJXK3aLzTQLG2VwvQiJpFVjioFzHfNAwO+6CK0N5junJ/3c9cTUjOTKWVT6AGsTsDRQFheDPfDtAeS0nkx4b+fKbgj1v0bg7tlH3yBP+NO7r4yPKKwynbKb2pFhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786832; c=relaxed/simple;
	bh=3zTrDEmKCd6Jl18ZIrzETpP+APzN28i1iocnAWakA0Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qZq5bMRjVV6NHNh4dmk00UIijWN1zzFIiyeKRNyEHf3x/NSLZ1gSQ4Y6z+phaKERrlyN22w1sgNWb8dslmwxHCufuHvUL5HavLTslTp/RVb2+KDpPHD/LF4CiSfjmOBSM3xxHhDsqftKbFOFbLCnx/CuwKHgA18y2XoHR5ZxC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZo5zSnd; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZo5zSnd"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6F0F40C5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jun 2026 02:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4p2gtTiGLOYL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2026 02:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1334340C54
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1334340C54
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZo5zSnd
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1334340C54
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jun 2026 02:33:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1103B41FC4;
	Tue, 30 Jun 2026 02:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6299C1F000E9;
	Tue, 30 Jun 2026 02:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782786828;
	bh=Gtcrm5aKXsptYwYQW9c71HOpswU4kLbcGQAhPy8GojQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JZo5zSndpAtM+OaTcOOoBKx2NTfYBqxVrvzwN+ZmQ2vOGNdNu48JTFTA+5eOxkRRO
	 4BVbCDPhGaqbKVteWmncck9mIG6/uhYtEzAfP4A+JkRun9ySW6vEmN14+bd7NJQ038
	 u6HFmlfvLmdqwHIMVodbJlgj00PE0zkaba+pOIfCTjLjEXKHp3bR8RE4rmKgabAbcg
	 23SzfX/SfSC7LTJkRm1VfTizUME5F1X8i/LZGOEfEhh3viad73GZpwrpBCMvbsv/dX
	 bp24+UoEeRjKr+ZFWgHcFNq9Ny3+rXwHUmaVzq4Ob+Ny6Gh/refAI5+bf9PcFEkymC
	 62KbpNc2/FpCw==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] modpost: prevent leak when early return no suffix
 .o in read_symbols()
From: Nathan Chancellor <nathan@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260624044742.144852-1-robertusdchris@gmail.com>
References: <20260624044742.144852-1-robertusdchris@gmail.com>
Date: Mon, 29 Jun 2026 19:33:40 -0700
Message-Id: <178278682007.3414597.2722879998608613962.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=582; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3zTrDEmKCd6Jl18ZIrzETpP+APzN28i1iocnAWakA0Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnO2lwb18bu2RRxYQ+vjpdGqaSl3kmrwyruXvkzi00KJ
 /w4o7ulo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyki5Hhn7Zi006OW2fvfc17
 Y/59Z9+qVa2fvz13qi+2irf5utjhlTojw9Oep4/abcJmrt9tZ6YZviAkb3Fvn7ntKU1TDrnMR1c
 tGAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 24 Jun 2026 11:47:42 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> The allocation for elf info symsearch and hdr from parse_elf() haven't
> been released when return because of modname didn't have suffix ".o".
> And it seems like the suffix ".o" check did not depends on parse_elf()
> to succeed first. So, move the suffix ".o" check before checking
> parse_elf() result to prevent resource leak when the modname didn't have
> suffix ".o" and return early.
> 
> [...]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

