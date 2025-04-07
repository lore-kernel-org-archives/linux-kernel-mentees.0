Received: from bsdbackstore.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B30192D68
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Apr 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012414; cv=none; b=XFPa7t54VNOKxxmHcbM0/eRCdf0T7lZmThQz2PS1WmMYl2YfLmyuyf0EtFpNAa4MEpFecayAkSKx1MNQ17aIXUPwclx5UyI5oJZAcCS4vVSWAJMNvIyoWux+otqjA27yqoKSNZ1a//r2OKuXLnflYb7qHy4ILXIXrlqBgAn7LFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012414; c=relaxed/simple;
	bh=kQpk2AEhWdEDddyXK5JyOrU800Y1u3TPWe1XZ7f8JmU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=USQnPp/WS6+Yi+IpPuPu1iEHyjwx72fMAw9i6hB0c/8ikxiJTBZTFf8B1q8OpRcVfSGG/Obqk3hCqpXHlJa5qjUCd08sB3tBn6QcOAvtm/ujR6IsOyozDFpm7KKoD+8BazAiHD/SK89fg2k+OsuqfE+GPD6LdOHOeYWAE3QEMCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bsdbackstore.eu; spf=pass smtp.mailfrom=bsdbackstore.eu; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bsdbackstore.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsdbackstore.eu
Received: from localhost (25.205.forpsi.net [80.211.205.25])
	by bsdbackstore.eu (OpenSMTPD) with ESMTPSA id 42774c35 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 7 Apr 2025 09:53:22 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 09:53:20 +0200
Message-Id: <D908SSFL0E9D.24WXC0I3O6AQB@bsdbackstore.eu>
Cc: <linux-scsi@vger.kernel.org>, <target-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH v4] scsi: target: transform strncpy into strscpy
From: "Maurizio Lombardi" <mlombard@bsdbackstore.eu>
To: "Baris Can Goral" <goralbaris@gmail.com>, <martin.petersen@oracle.com>
X-Mailer: aerc
References: <20250402204554.205560-1-goralbaris@gmail.com>
 <20250405143646.10722-1-goralbaris@gmail.com>
In-Reply-To: <20250405143646.10722-1-goralbaris@gmail.com>

On Sat Apr 5, 2025 at 4:36 PM CEST, Baris Can Goral wrote:
> The strncpy() function is actively dangerous to use since it may not
> NULL-terminate the destination string,resulting in potential memory
> content exposures, unbounded reads, or crashes.
>
> Link:https://github.com/KSPP/linux/issues/90
> Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
> ---
> Changes from v4:
> 	-Description added
> 	-User name corrected
> 	-formatting issues.
> 	-commit name changed
>  drivers/target/target_core_configfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/target/target_core_configfs.c b/drivers/target/targe=
t_core_configfs.c
> index c40217f44b1b..5c0b74e76be2 100644
> --- a/drivers/target/target_core_configfs.c
> +++ b/drivers/target/target_core_configfs.c
> @@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struct c=
onfig_item *item,
>  	}
>  	filp_close(fp, NULL);
> =20
> -	strncpy(db_root, db_root_stage, read_bytes);
> +	strscpy(db_root, db_root_stage, read_bytes);
>  	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
> =20
>  	r =3D read_bytes;
> @@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
>  	}
>  	filp_close(fp, NULL);
> =20
> -	strncpy(db_root, db_root_stage, DB_ROOT_LEN);
> +	strscpy(db_root, db_root_stage, DB_ROOT_LEN);
>  	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
>  }
> =20

This patch doesn't apply anymore.
strncpy() has already been replaced with strscpy()
in version 6.14-rc2.


Maurizio
