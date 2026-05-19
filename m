Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063363DF00D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 May 2026 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445358; cv=none; b=GQrO0AluvQLaAzZXaAQwdOFIqzSCRBf4mckUdQTyFjpPZmLEJiaKvp2+G+1la8hml7I1K59NvH1tONhwkBDH2W0puYZgzWpP8F6yeCqej7RPy3Cl14GF+9IwxWk9lCUj+rp6XsQsTpRlY8sKV6rb3h0rVqUByugXFUJokurx8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445358; c=relaxed/simple;
	bh=2GaXRtOY7FZ6ZqZsVgo8+Z5yk75ps1TTX+Sse9+bkps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZfCEO4G678fM4oS43S4IA3hWJPaqcWUeJTrpljlbdOJjQ1o8xk1IajY+s4f6VDfNRuFPnfAkMG7l9ASVof481uuHtZweZDzaDOyfj49JqKNWdMJmcx553gfUhA7OX5Ah3JYobAy0onl8Uq8WkmstkNIToo1JQuF4n+vkaOUMt4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXti7G2K; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXti7G2K"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD9E6F65C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 May 2026 10:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwrMdsA8yPYt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 May 2026 10:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF93D6F629
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF93D6F629
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXti7G2K
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF93D6F629
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 May 2026 10:22:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF21A4342F;
	Fri, 22 May 2026 10:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1919A1F000E9;
	Fri, 22 May 2026 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445354;
	bh=nisFIKF+tUtu++YSJ7NWbE+f+sXcw391IfeR0su27Dc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XXti7G2KrktT61C44A2OiA3AqQSrOtaZGGiniavU67RwQYq5wKtOAkRMmgIMNDtHK
	 mGZeFP/ZDsPuVyNk3iyFyfJHjKXFBSgRjSpIjGszZHwMESGNNQPwU5UUt0xGCNP3tn
	 4YQeISQ+ERkfhsfbq4NztCcs/6disJhF6yoBqBi0pigpzq4dtx2wyr7rrjoOHp8COA
	 QbhjuRb10XfOXMqfYIUzvz4kB/3uqml1txpx4DXcD2RXy5B1R9Rzx+uDFR0S7oDF2N
	 qhn2h9/N5l5MsVjFzacIe646MlPJHLiHw/+CNvEvZEnrV2V+rRyjl6M8CZ42pteb81
	 rZK/MrUDwxqQA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260519054024.274741-1-robertusdchris@gmail.com>
References: <20260519054024.274741-1-robertusdchris@gmail.com>
Subject: Re: [PATCH] ASoC: soc-utils: Add missing va_end in snd_soc_ret()
Message-Id: <177920265231.6167.2169891389929995926.b4-ty@b4>
Date: Tue, 19 May 2026 15:57:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2GaXRtOY7FZ6ZqZsVgo8+Z5yk75ps1TTX+Sse9+bkps=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5oWaBoC5/fg26tGV/4zFKTgqoOQMUpKbwc2
 zLqvA3ieKiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuaAAKCRAk1otyXVSH
 0J0LB/wO0p/bRbI2Ju0VAIZRliuu5OB1mwYCmntYs2NNdjBzxBvWIYENfYqGTE2/2D7Lp2I4aIK
 BKqvFduR4cHbO0yqxkIsmWEteMDpBbZPfXWIzmbS/okVN7ZoygK+16bJsVPYnTwVCtNYrPH8yei
 r5vD+D5WxsGKilRXnqKEyUxT7PP3bHfngPfszSGM4YPCDXpH1yD1QznQHNgd8xcaB+KzdRFjaYA
 H10/yfXJ7VNlFfglcrLOewgjYzbSJAauhhcPk3nvvjoXkaQUDJO5qYRRLO1K9hhUxJ/NMrTEWYc
 cq0Ol7FjsSZBvE8XiZETFbQ87ZEMl9gtupXG48JZgG1uFFTU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 12:40:24 +0700, Robertus Diawan Chris wrote:
> ASoC: soc-utils: Add missing va_end in snd_soc_ret()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc-utils: Add missing va_end in snd_soc_ret()
      https://git.kernel.org/broonie/sound/c/298a43b54432

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

