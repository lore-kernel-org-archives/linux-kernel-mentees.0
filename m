Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3431077A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Sep 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346960; cv=none; b=cFqmhjQunjHx/eHeeR3YedAM3gl12+iRJf4y0uFA77QNiSZ0E88Fj5VIlRPXlzn4abORRRPCvUXiOMrGU7MAfQi44Vec//V/YYBwA4UTayrYxa3biDg0lRZDaag+4RYwG/tctnMCiBMdArxdBPCLn3Odo9DP3SQJXivCEEQq+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346960; c=relaxed/simple;
	bh=NZDJnhY8lU/HjSsPA1w4OkvvxgfbZxmjWKy8iU7vN7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYJIYHCgNqBS6xJn9tVUiHHFV2mBBmhqmGU7gpnRHTdujLfYJ81jCMHlOU62zX7o8iwm/+Ej+qzhgsdu+d7d6px8Z0+QHBOZVCgWOkXv2xIfFVtk18ExU5Kuo3B6ryTnr/KA7yle6XTAZWvuq/A5VpVjj2Bn/hcC4ywvXJqhYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbCh87f7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbCh87f7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A18880D46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Sep 2025 15:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItmokFh1xUD0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Sep 2025 15:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34BCC80D43
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34BCC80D43
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jbCh87f7
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 34BCC80D43
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Sep 2025 15:55:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 724EB601D4;
	Mon,  8 Sep 2025 15:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0420AC4CEF7;
	Mon,  8 Sep 2025 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346956;
	bh=NZDJnhY8lU/HjSsPA1w4OkvvxgfbZxmjWKy8iU7vN7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbCh87f7vZk9K2GzwhXiVS7enXUJ0h9BzgE324mzIUxBmMaeuAJj8ITrdBVjX9C22
	 YrQ59pIc5R+OIpU9/I+G2HM7PvBK2Pe7T+u3ljZ6m8lB3r3reG+4vAuh/cBwjXe35R
	 5K+vLMZWeCaklHR59LtDwS9qd/CXLK5LvIhv5zziT7yS4HuJVpI8+osxZWo+j5kNSc
	 HkIOjfglBmUNxiTvg7OrAAVaNoTHN+n5X2Xjc8sQQtyUHNpc5OBrYZbnQsxgYIHGRq
	 rspukF8hzq4CY4pbbGUMIykMK4oHLNbrnQ11XEFPKkX6DiVJZ6YvUlfg8pxleNr7bY
	 FNbI3UZhVKK4Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	corbet@lwn.net,
	vivekyadav1207731111@gmail.com
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Mon,  8 Sep 2025 16:55:33 +0100
Message-Id: <175734370604.150805.8413945497648461480.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 23 Aug 2025 23:13:59 -0700, vivekyadav1207731111@gmail.com wrote:
> This small series makes cosmetic style cleanups in the arm64 kselftests
> to improve readability and suppress checkpatch warnings. These changes
> are purely cosmetic and do not affect functionality.
> 
> Changes in this series:
>   * Suppress unnecessary checkpatch warning in a comment
>   * Add parentheses around sizeof for clarity
>   * Remove redundant blank line
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/3] kselftest/arm64: Remove extra blank line
      https://git.kernel.org/arm64/c/3198780eaf37
[2/3] kselftest/arm64: Supress warning and improve readability
      https://git.kernel.org/arm64/c/a940568ccde4
[3/3] kselftest/arm64: Add parentheses around sizeof for clarity
      https://git.kernel.org/arm64/c/62e8a9fbaad1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
