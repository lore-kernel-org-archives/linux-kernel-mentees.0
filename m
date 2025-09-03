Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F2E2DAFC3;
	Wed,  3 Sep 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909740; cv=none; b=WyJx/+f0IEL84OfamWoU8v+YQ04ljnrZ8X9AqxjvvptBnsCJtIL/Fk9HYSancrhraKXxAPS9TVHpfsc2j+4VkJhpabAm3FHo/Xtgiz0kgxzhh8eqT6raPvMx4VyPUmq6WAp7xs2B3GltDvKZmfZytDAW+rrTycjML/JHOG1/R9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909740; c=relaxed/simple;
	bh=+xPOd4f45WPDr95sOTBzfgNj/2vz11TzolSQbfG5XQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qjNqhEr/B9KXnlykGqh3D0NypANeJeJ43j4+i6qMm8mFIJTEwMjVaOea1UaSYYTl59fcpOq+sGkQMuoF7ewclk3/jrJCJvswC81Gm2oiBFx1MvXJSmyMyktQc8ie54EBmmHBqGjSlw5opWG/P574RxH1cz3KM7mlvedjeCAUnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ2rW4IC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZ2rW4IC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52280C4CEE7;
	Wed,  3 Sep 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756909739;
	bh=+xPOd4f45WPDr95sOTBzfgNj/2vz11TzolSQbfG5XQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bZ2rW4ICLruJv+JGuSoMKakoBEXTp7Jk+d8cZZE6AWS2vP8Q0+SjNxja7oaHFuFIS
	 T4NunFW3lyX3Vw0OPRQ34DkUuxlG7taH4iJY8GP4lud5Ef60YjBZpWlpDCqk2qiqZx
	 V2nUA3TbmADKujnSXGvXtqpz3FRPotHUjPE+pU5HsGmU+8fxMakCUL2oK5AxBg1q5i
	 Trh+5mkmVhTE6pudGS9IEzm4BDkrpHDBQ/JLPQqx95gQkn/gIRnJRLoK3lN9jKW/jc
	 z6jbh2EXREThbt2DeG85nafhlKBC+dHvhda9xfxa3wj/DkwhjVtT6LLJzKi1GAlbjr
	 vhIjwBjO7jpzg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-kernel-mentees@lists.linux.dev,  skhan@linuxfoundation.org
Subject: Re: [PATCH] mtd: sm_ftl: replace strncpy with memcpy
In-Reply-To: <20250903121746.2527046-1-rk0006818@gmail.com>
References: <20250903121746.2527046-1-rk0006818@gmail.com>
Date: Wed, 03 Sep 2025 16:28:57 +0200
Message-ID: <mafs0ms7bvcd2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 03 2025, Rahul Kumar wrote:

> Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
> terminator after the copy. This aligns with current kernel best practices
> as strncpy is deprecated for such use, as explained in
> Documentation/process/deprecated.rst. This change does not alter the
> functionality or introduce any behavioral changes.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  drivers/mtd/sm_ftl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
> index abc7b186353f..575e137ce8f3 100644
> --- a/drivers/mtd/sm_ftl.c
> +++ b/drivers/mtd/sm_ftl.c
> @@ -44,7 +44,8 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
>  	struct sm_sysfs_attribute *sm_attr =
>  		container_of(attr, struct sm_sysfs_attribute, dev_attr);
>  
> -	strncpy(buf, sm_attr->data, sm_attr->len);
> +	memcpy(buf, sm_attr->data, sm_attr->len);
> +	buf[sm_attr->len] = '\0';

This writes one more byte than strncpy() (which would stop at
buf[sm_attr->len - 1]). Is this safe?

>  	return sm_attr->len;

Since you write sm_attr->len + 1 bytes now, I think this should also be
updated.

>  }

-- 
Regards,
Pratyush Yadav
