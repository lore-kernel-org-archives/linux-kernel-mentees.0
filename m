Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CD30C0EA
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Sep 2025 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161359; cv=none; b=QaulB76AKraXFs6xqeCX9BO2lGucW3gsX1in3+aQAwa+Aq/PIqtCZm4w09dBT10UJbWaccKKRcfimoLJGUlDREvITZ+CcKbm5r7QqQFIFXupKK9+0An21LTKUvXqp3h4C3+CFm/U9MJpKhZAL7CerseEVT3t5+CU+Io5bxGYRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161359; c=relaxed/simple;
	bh=PmnnP3tlJb7sfMJLtSPFp1ePI8TpZG2gGLM4TeLP9EI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j+2oln2GxSHLvf+hTCkfwcKwvpLfH57nGF/LKloIMmf2jc7fiRO3UQmBQqogVITEqMIgkbWCQgI9jcV4fRxE51W804cLb7llv0OGJ7I553StApdaVQgLR/t75eXvfnlX2OhtCO+i6nhtGisKmgjMhYcLFaWq4h2IK6AftFE/0wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Aoiv0H7a; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Aoiv0H7a"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9BD1C02449;
	Mon, 29 Sep 2025 15:55:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87324606AE;
	Mon, 29 Sep 2025 15:55:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A909102F198F;
	Mon, 29 Sep 2025 17:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vo4QfhD98L8b58KoDVJk9jRcoE5N2oLtCd0bb1BghPw=;
	b=Aoiv0H7a+tE1fllLiatpWiOhyfR6Nih+buSSLBvfymK3Xc3I4nHglWrZtS31S1P9IJp7B3
	vp3h4a4hLoWk2L48j43Uveev5k9baoVPXKe8dAEF8v4XzvBo+MxZapnEjmSZ6qprAs6+iC
	tdKeKCAK4K4c6Yn0RWUHb9xSQg/EIbYugqFhcyijKHy8ZlU4AfCboOokVuOUvi9go/i0kX
	H1NCzfTd/fBJYwQmpU6L7GxdTBWk5aN6iTSJ4xkqRUkYU4SlLBZVhReVEepQ+317t1b5Ak
	GYOwEuDeV7YuEAuisCSqrmsKzwfLUWWNP+qo0rB46rFXeKGbzFI2uKOlxgSe4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20250922110727.1423318-1-karanja99erick@gmail.com>
References: <20250922110727.1423318-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix error handling path in
 atmel_nand_controller_add_nands
Message-Id: <175916134713.50416.13477111980143091827.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 22 Sep 2025 14:07:27 +0300, Erick Karanja wrote:
> In case of a jump to the  err label due to atmel_nand_create() or
> atmel_nand_controller_add_nand() failure, the reference to nand_np
> need to be released
> 
> Use for_each_child_of_node_scoped() to fix the issue.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
      commit: 8ed4728eb9f10b57c3eb02e0f6933a89ffcb8a91

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

