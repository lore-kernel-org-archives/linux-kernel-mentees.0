Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06A1CAA65
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Sep 2025 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316114; cv=none; b=Vtl9bQnbqJmAZyBs7seF5XQsxu6l6rrDFpfIhCJkaMh66DITg7StSajFFGNPYUCu5AMtVGjW3XAjGbpFjjKIZiZ0i/UXtZCDlJ5ZTU9vNJKeED83UtNsYwX/suK0JZcnpsPdhbPGD2GCZ0C5YySA/2DxH2d5LOTsYAMZCE2cIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316114; c=relaxed/simple;
	bh=sydoGYYBrWq/YA+9ysgHv8l73WXm2B/eim2nQHNNGNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EQ9zHe2bP3Z7SZhPomuOpAiGAd8gEvrz0FXMj3xtlmIva/xOpNuOIugegMHjAMchweJxivQ+vBcLmPq3AaPFTvDtHCLJnHwyPMZD0xwooepjwO+fWSIPL8e+Jodo/tEkxAbazSKy06RzDauRni4wcAwlVm+gVjhnCqpLvsu9aAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D8vJzJvK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D8vJzJvK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C7B901A0E10;
	Mon,  8 Sep 2025 07:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EC9D6061A;
	Mon,  8 Sep 2025 07:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76E3C102F287D;
	Mon,  8 Sep 2025 09:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757316102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UFbPuS3hzmJpKbl+CTamAVLKJpGuiE0FtQwoUF1Gh3w=;
	b=D8vJzJvK/ysAMWSjxGWa9z6JX7mFlll9Uz4aqe3ECq93Uz1wfREJetUHBUPZgBJ55RCS/J
	x2/BIH86UACVHflCaFFjAFD3YBiEsiL4qPUi8twaBN71IIyq3WDkjfXv7/T5nspGnD8MEE
	5qaxbanDwnOgANriZH9eyCXzGQUuVS8gt4+A9Z/EerZcfXfLJ1jOnC+iV0e/Yn18qg3+29
	TjV1P/VwtNItRr5VZyKTa2kgCkN2A014Tic010poaiPBnJpO+sULpEvyr1QFxOdVsp7vIW
	55vlm/Y1W5PtJ5t/mfJ8aOWDwLkeBtK1PyuM2THdDgPzvq2aKo/rxFUctvddXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-kernel-mentees@lists.linux.dev,
  skhan@linuxfoundation.org,  Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
In-Reply-To: <20250908070124.2647038-1-rk0006818@gmail.com> (Rahul Kumar's
	message of "Mon, 8 Sep 2025 12:31:24 +0530")
References: <20250908070124.2647038-1-rk0006818@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 08 Sep 2025 09:21:22 +0200
Message-ID: <87tt1djtot.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rahul,

On 08/09/2025 at 12:31:24 +0530, Rahul Kumar <rk0006818@gmail.com> wrote:

> Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
> terminator after the copy. Also update the return value to reflect the
> extra byte written for the terminator. This aligns with current kernel
> best practices as strncpy is deprecated for such use, as explained in
> Documentation/process/deprecated.rst.

The doc states "strscpy" as a replacement, not memcpy.

> No functional change, only cleanup for consistency.
>
> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
> Changes in v1:
> - Update return value to match the extra NUL written.
> Link to v1: https://lore.kernel.org/all/mafs0ms7bvcd2.fsf@kernel.org/T/#t
> ---
>  drivers/mtd/sm_ftl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
> index d28d4f1790f5..3c5d6d0c728f 100644
> --- a/drivers/mtd/sm_ftl.c
> +++ b/drivers/mtd/sm_ftl.c
> @@ -44,8 +44,9 @@ static ssize_t sm_attr_show(struct device *dev, struct =
device_attribute *attr,
>  	struct sm_sysfs_attribute *sm_attr =3D
>  		container_of(attr, struct sm_sysfs_attribute, dev_attr);
>=20=20
> -	strncpy(buf, sm_attr->data, sm_attr->len);
> -	return sm_attr->len;
> +	memcpy(buf, sm_attr->data, sm_attr->len);
> +	buf[sm_attr->len] =3D '\0';
> +	return sm_attr->len + 1;

Are we sure the buffer is always sm_attr->len + 1 long?

Thanks,
Miqu=C3=A8l
