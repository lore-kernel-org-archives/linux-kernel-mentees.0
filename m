Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41E1A6808;
	Sat, 18 Jul 2026 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334216; cv=none; b=aAkvIIjkrYyu7emovriDbPqQ4rOqiWCZNv9uwBiSLKZASI9tb0Ut7U33rq4sWyshcjR4u3vhpKhIscN4SW3h3+x/FPs/iXJfsNzxFwa0WZWmAG5NBPg6KHWJTOfWUsuIhCSYcdwpO4qjx6D35BR5JVYVPXdlKLEqJyiqqta9KFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334216; c=relaxed/simple;
	bh=SqddXHxoXAS44jnllTsPz243Fteup6i12LmMS6C4/uM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h5yJL6jY/4w/5uC112JuSiDi2yJruzwaWYoaWvbv694+rAOhz7jpfvGhrsBw632907v2VfKPbdCR22ng18I/kwkgsR8KK/Xi0xBLme/9CA2HBZNN5lwXuVEqHdffmQ2ExUBG62tts3kav8BwCcpP0fNbDqYENV8DbcMfZHkFJLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFKXG2Q8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFKXG2Q8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18471F000E9;
	Sat, 18 Jul 2026 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334215;
	bh=4coRiwjvVBqf9n8LjEuWK2QLrVBUAzdegtEpYVf9CGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HFKXG2Q8LPsQkg/og7HN0ZZVHzu/p+orGhphIVJ6Yklf6ZH489WWo9MG5f+Tpf8fI
	 WWT6sBE38u450BSoeZPI297irPC+k8JlMI+OUJIFPmwwXO98KlZDRsAE5s8gXFGM8T
	 hEgDt80fbjvoBce/1TY2eLirwGWuahIFJyZeOImLfN46Z+9P+4BGaQ8SabVDRC853+
	 J7BPdMKAniK07rgLnr12UaRTFfWUy24bQ96/U1Wunr70+E1zB7YXeUiSY0T7B5So9m
	 W1QQpVa8vsQKgAFVGElm+VEVU9XKNxZ1D+ovK6CWl//Gq1SrHob3zgEaXSzlFqW6VT
	 Nhl0nUTEQCpcA==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260714192228.1639768-1-ninadnaik07@gmail.com>
References: <20260714192228.1639768-1-ninadnaik07@gmail.com>
Subject: Re: [PATCH] regulator: mcp16502: Convert to dev_err_probe() in
 mcp16502_probe()
Message-Id: <178420670127.63368.9042373456774603095.b4-ty@b4>
Date: Thu, 16 Jul 2026 13:58:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SqddXHxoXAS44jnllTsPz243Fteup6i12LmMS6C4/uM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWseEiBgo3xyo82UaljCOR9Tn6rPG3NzUrPvhQ
 klhEhsi7M2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalrHhAAKCRAk1otyXVSH
 0MQ2B/sE5oVaySi960GBX3VYSnhem3ODfMEnMaaccMh/1EwPZkvQGB5lJ79kdGeMACOhV+hqg9X
 q4rHN+i1LFDayg3ft9ZJAsJVatldrCsAHUxv+jo5z/OAVG8FSYtEk3rLK4MNi34mMIZ4eOhilMI
 UaZmzrX2RTHlvSPJMWooAUI3hBN7jOCx5ZIbRlCNjDfqZTbCl8FVUHX8q4AgqPuyIJNgNm50KHX
 yO9Et/3H4gKGoMbnpIUlfHSOtU2RdwE8l6Mkyw76VX1I4P3SkulS2HjvHpUnXFOE8G+qgBYFvNi
 AfHD7nIRujT3opRRj3aa3OSEJtFmCs+XShWwKXHNf2nrbbuD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 00:52:28 +0530, Ninad Naik wrote:
> regulator: mcp16502: Convert to dev_err_probe() in mcp16502_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: mcp16502: Convert to dev_err_probe() in mcp16502_probe()
      https://git.kernel.org/broonie/regulator/c/25706f1ab9fb

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

