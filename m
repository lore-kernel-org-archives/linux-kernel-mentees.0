Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404A42E62C
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743866753; cv=none; b=Y2wpWdCc1EwGdT3fGlM9C5vua9LenMmmrz+kwGC0mQ9KIgsUsIK1ayI2WQAY2yE16zaMaOHc6hcbO/difPxM+LX/woN5fCniuP2Bpqd7kOGoKwJ0CBC4WIVURroimvqwi7sTe8i+szo/z1DIiQB81S/zFEIQ6cXDYEmsMPo4IoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743866753; c=relaxed/simple;
	bh=h3GhfBIiVRF/Pd3aAJkjlB+5zHbq5qv4N3L5/N+zLiM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0sZ7uepcqIshOc7zWpE2Ko2IgBVrDlWJ/d63UxQzoAUbsRt4BSIgyWleBYg0FQenE4QuGflWdIREQC5akHEuaXxm2mZFgjPcveyz28qYu1szw5LTwH3HcosS1fE/ThcxBb7xSrjEb5d4eSyDCdJVMxwaUtxYUXUhLUEUU6vQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlRkl4Hp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlRkl4Hp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so6828045e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743866750; x=1744471550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rYQcQMBl9xOlGSmouhghPZmgfZgiwJh9mi25o4o0Nw=;
        b=PlRkl4HpPNJHosfrT0kAd5FleOKNVDcXz3skIF77yDm4csPX/g3oANfxa4E6pC3IKH
         o18/Tq/ePlDZz/dsc0oQBPKaEIkQ9HXcsO8PolamwXqnS/KpAKAjAbH1AQ9s+d0Zp4Bu
         n4YmxepnZIBw5mFWwLAW1yw2HTMSmQ68pLDCcvS5Zxohhz76myA7V+6fMQB4O0VABF3V
         k1RHKXRaNdVH1gG65oJgBTaPA/+/BI4rNeTK3Jmr6SbXFvXVhyZ4uDMOvfoEvuFuc28z
         XRyPHWwZyNGdtOgJNOiebImdsq6ODZQw5f5sROdFgE1uGxn57ET5TeoCgHZtyK9mZNYA
         dZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743866750; x=1744471550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rYQcQMBl9xOlGSmouhghPZmgfZgiwJh9mi25o4o0Nw=;
        b=ZqyA9FCO8AdaRXxCN++SS++yR+MP2X+/hQR5yb2PhBKPPw0ibNWgBFRdo8ROqcdMwN
         D10OJaodHsRTEcoZ12hAww9ImxxiwB777logreSfE1Ho5H4eKGYBW7LOwg//rjsPC15H
         FyDTEY6v1zQBiBpU7//zK3/VCDqVBkhjsW5UN4pub24+xyk84sJEhjsV6x2AI7uh4WSA
         ylITqOxUKvwxq3SWK/YhZmRBPDzdOeSzt8n9KMlG1h88uNvwBpXxg5YlHXYjWT8k2cpO
         bw9cgnfZ30fJa8ZxYKBxMWkHuisGmP8qW2gDqI9T5EB0vUIBelRzXXXbtLpoHAuooEEA
         yrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnUoerJo9/qDrnMItxq5jy7bI0HwfsIpUDLTJ37Z/st8jtNZmfEl1A9f0JJn/imejmWYSa583oejayF7oVGeEykmVcOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHfDoszYPDiBeM9ieSrFuJkkGZReSEgObroFwXpXh95jnhzWlB
	xx+pUU0v4Ob8Ou1vGmoCx11wcX1lMriTMvgCfPzA3vq0wfw9S7iR
X-Gm-Gg: ASbGnctZ0A05d5KCkEm925krZWNv72K4UVNK8Jvy8DOJQ97i68RtinmoVuUbLf9f5Bh
	XCU4VToQCxD3NvQtJyav3iDBAVAXr6TmG8tj/YrjsZOFyDivHOwnwTheOU2Wkvd0xqdo8wtLKPv
	TMRuE1+e55D/087u36BHnZ7dgpkkGArtyuJ33cPzq7Ezg9kIpIlyi6Wb+mk+N6RfOjalx2YjekE
	5wDmpyeageMmosLL6RIqa7Z/phsZfdu//pnFCpgctmHS0tNjfNcx8i3NKhGvSI8K1LoQUcnXIhY
	szWoF42AIwjCuFUkLnZ6NJMiUhg0UiBE+K7TYtEEaup04YIIy3DXyOf7DSVZK+vkvFmoa7T1UET
	gnb34/lI=
X-Google-Smtp-Source: AGHT+IHP3tRbXf7i8RI1670OlH08T8lHDdFW9fMLv8Xn/kEmEaNz4d/F/FiflXkACwCWZkgl8ZM6+Q==
X-Received: by 2002:a05:600c:8719:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43ecf8e7321mr76664845e9.17.1743866750233;
        Sat, 05 Apr 2025 08:25:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm75438015e9.25.2025.04.05.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 08:25:49 -0700 (PDT)
Date: Sat, 5 Apr 2025 16:25:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Baris Can Goral <goralbaris@gmail.com>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] scsi: target: transform strncpy into strscpy
Message-ID: <20250405162548.310dea37@pumpkin>
In-Reply-To: <20250405143646.10722-1-goralbaris@gmail.com>
References: <20250402204554.205560-1-goralbaris@gmail.com>
	<20250405143646.10722-1-goralbaris@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  5 Apr 2025 17:36:47 +0300
Baris Can Goral <goralbaris@gmail.com> wrote:

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
> diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
> index c40217f44b1b..5c0b74e76be2 100644
> --- a/drivers/target/target_core_configfs.c
> +++ b/drivers/target/target_core_configfs.c
> @@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
>  	}
>  	filp_close(fp, NULL);
>  
> -	strncpy(db_root, db_root_stage, read_bytes);
> +	strscpy(db_root, db_root_stage, read_bytes);
>  	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);

That code is broken, it reads:
	read_bytes = snprintf(db_root_stage, DB_ROOT_LEN, "%s", page);
	if (!read_bytes)
		goto unlock;

	if (db_root_stage[read_bytes - 1] == '\n')
		db_root_stage[read_bytes - 1] = '\0';

	/* validate new db root before accepting it */
	fp = filp_open(db_root_stage, O_RDONLY, 0);
	if (IS_ERR(fp)) {
		pr_err("db_root: cannot open: %s\n", db_root_stage);
		goto unlock;
	}
	if (!S_ISDIR(file_inode(fp)->i_mode)) {
		filp_close(fp, NULL);
		pr_err("db_root: not a directory: %s\n", db_root_stage);
		goto unlock;
	}
	filp_close(fp, NULL);

	strncpy(db_root, db_root_stage, read_bytes);
	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);

	r = read_bytes;

unlock:
	mutex_unlock(&target_devices_lock);
	return r;

'Really nasty (tm)' things happen if 'page' is too long.

	David

>  
>  	r = read_bytes;
> @@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
>  	}
>  	filp_close(fp, NULL);
>  
> -	strncpy(db_root, db_root_stage, DB_ROOT_LEN);
> +	strscpy(db_root, db_root_stage, DB_ROOT_LEN);
>  	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
>  }
>  

