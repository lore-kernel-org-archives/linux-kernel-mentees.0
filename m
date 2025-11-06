Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BB26F29C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428851; cv=none; b=gesg56w3aU4Ok0VY8cUgh/I8XGicCT8XuIWNb3tcYvhk6bxcc3R77NsT6P06XaBpluoPbBJfLrXM6WhbCIugsBV4ZEur8JNawrZriaI/JOf1jHxtEOMt8DcD6EgAx9HYJB83cErGEGt7K1Fhm6TutidwTIsxy7oFK46H5mmhirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428851; c=relaxed/simple;
	bh=x0vSPZuKoRb3szafYiv21K0FcdiPZdKs0Jp10xlTOqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FCb8rSxE0Cq23HwzhtedKgszfvXHTZQjyFVtNWMx+YxUPwqLc52Ey7L7g1NG0QHAkKgf2AIz+FCKT/03uZYygHdZaBC5/+j4skmWZrHfBmIhiuir8ISBlj+QyW4Q2+GSvwNUvG/Ta3X68iipFMoS+77mMqRwU1ccdaGUGRG85CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZwpeJD5; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZwpeJD5"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E080B40F84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 11:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJX7kq3aik9u for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Nov 2025 11:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3EE241264
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EE241264
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZwpeJD5
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D3EE241264
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 11:34:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9A55601B8;
	Thu,  6 Nov 2025 11:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F75C19421;
	Thu,  6 Nov 2025 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762428846;
	bh=x0vSPZuKoRb3szafYiv21K0FcdiPZdKs0Jp10xlTOqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rZwpeJD5qSn0xu/aGF3pXyhMLon1Go9aoKkG1nuVdqFSpyZVcT56FbiQqQ3zKDs8Z
	 /Wc1Hs59K+N1++qOXxcxUDLeG5g3b8YtNKJyJglTk3If109pRtrCy5WRrP5absdUlU
	 nNFoS8P7dBDqK8xRNz3LJ24vHDlYNRHGFbj536mMpIqPB4h5XkM6PttyBLDIsvN7R2
	 Za4Ky13ASREhFVbX1uGrRmwtXaqmMLVnbK0wHpJst9lF9nQ97HN9dujeP8WIySrAod
	 suOpisJDZK5M2wbqMdmaldf1Fjz97jNne32fQbz8VBZ8isfHvUNV6IT0Nll3oqiFcu
	 kwTG7EhCPWoTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ranganath V N <vnranganath.20@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20251104-dtbs-v7-1-224aacb09671@gmail.com>
References: <20251104-dtbs-v7-1-224aacb09671@gmail.com>
Subject: Re: [PATCH v7] ASoC: dt-bindings: ti,pcm1862: convert to dtschema
Message-Id: <176242884289.2357326.13162539553675802549.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 11:34:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Tue, 04 Nov 2025 16:04:58 +0530, Ranganath V N wrote:
> convert the Texas Instruments PCM186x Universal audio ADC bindings
> to DT schema.
> 
> The PCM186x codec provides a single digital audio interface. Therefore
> this binding adds a reference to dai-common.yaml and defines
> '#sound-dai-cells = 0".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ti,pcm1862: convert to dtschema
      commit: aa897ffc396b48cc39eee133b6b43175d0df9eb5

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

