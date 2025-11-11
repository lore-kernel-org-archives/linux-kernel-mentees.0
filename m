Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687EA2ED846
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901457; cv=none; b=CT0eUDZGze5CvBLxFJLqheMcYJwDCO5Zscf2QuCg+7FzkDf6+LTeqZH7gjnZe1P14pWdxrab5o+MlucIHbJBgxZS4488Vu+v6azvgw8G4H5U+XOx6GX0s7gGoR5i8FcZNFTBKoFEgNYGgvpZsYmBBNnFsQNtssAzqIwbOTh3yeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901457; c=relaxed/simple;
	bh=pnYPgV1/kV0KNl2wqSooNI4BldWEB/mQ+fVGd1Z+pwc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PZKd84btZZi1qbuW/x+3aCmt8tEqeTaQRy5lmzdoNJf7n1frZMS/SvOlrckXYXdjYErTBoos8tdua0w7KDEEF0RP01v5uMLCWDWochDepf3kp7s3dXRzyElwC8G63hcpzQx9JwZDFJxG1XhiY6ukxUP4ea+GVJCK+c15/lL685s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYscEzPv; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYscEzPv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0959F4027F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 22:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvrgTOXCUxgh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Nov 2025 22:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+f2fs@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F40A54021E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40A54021E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYscEzPv
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F40A54021E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 22:50:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C3FB600AD;
	Tue, 11 Nov 2025 22:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB9FC113D0;
	Tue, 11 Nov 2025 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762901453;
	bh=pnYPgV1/kV0KNl2wqSooNI4BldWEB/mQ+fVGd1Z+pwc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VYscEzPvG9y+04A1wO6HrUv/TkufhJXBvfcN5mnQ0t0xkf08ulS9RRuNXTh+6OMZj
	 LNC+uGlf7r+cKwcTK6orQlO1UN0/vdjRnaegQPuCC6vncmUFU8iKpTickky4QAlZMA
	 BP/TkJy0Y8XZh8wiGjlW1zM4febmOCEKSB4V8BIDN8HqaV/lTd1k+kWpmaS9pxjOsQ
	 45BdVeo78b5GtS6y9LfmZL2U4lUzGYDGY1UbMwiXlDohhP3Je24WpsrJpoyUcXDnLI
	 JRkc1BjFvEdkQrK86NL+f/IqfoKujp27b1nCW1BMU+hVCq0YVMZtGLK5OyCBFXMB9D
	 m6NeT8Tbgl5yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EE4380DBCD;
	Tue, 11 Nov 2025 22:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v4 0/2] f2fs: Add sanity checks before
 unlinking
 and loading inodes
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <176290142299.3596344.2753827119628915512.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:22 +0000
References: <cover.1762339963.git.zlatistiv@gmail.com>
In-Reply-To: <cover.1762339963.git.zlatistiv@gmail.com>
To: Nikola Z. Ivanov <zlatistiv@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  5 Nov 2025 13:09:41 +0200 you wrote:
> This series is provoked by syzbot warnings caused by corrupted directory
> inode with i_nlink == 1 that passes the initial sanity check which will
> only mark the filesystem as corrupted in case i_nlink == 0.
> 
> Tests:
> - fio/fsmark parallel create/unlink on VM with f2fs root filesystem.
> - syzbot
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,1/2] f2fs: Rename f2fs_unlink exit label
    https://git.kernel.org/jaegeuk/f2fs/c/7b4827ce2d2a
  - [f2fs-dev,v4,2/2] f2fs: Add sanity checks before unlinking and loading inodes
    https://git.kernel.org/jaegeuk/f2fs/c/d43f8de77d6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


