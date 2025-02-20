Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AF1DDC3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740052343; cv=none; b=fMDjJZyRzlUUbi6sL2RMzHOufDxhX1nTYpl/YEis0uq0U9qBBLhAGCfGCzMTVdAio6AQxHjLN1SON9tPDhaYETyQK1NyKwxNNKC9s0172yUUrJkRJjV5obdTzgix50n/7T7rYRJs/4CPDPIBQIZtOxD8kyB57iutmiCKOpQJrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740052343; c=relaxed/simple;
	bh=OO/lRbml8EOx+1I2P8+mJ+GB6x9c3YMzz/THQiiQX0I=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:
	 References:In-Reply-To; b=lWXYRy/wWewFg4ah5GtR4QFYfM3rMk7SqlT4daiPu6MxDqhlY5hmihzc3FknwdVd4Y+uRE7Aw4LvEFq/e4VOE47wRrJ9fEL2dVN1OFoxkbJdaCXbJaYJ97Wxj0ai85fVxfgHprogw8ncR/mFyV4qgsbNWdXUqmU2KR6D0hHvIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=Vfb9XVD5; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="Vfb9XVD5"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153C840CCE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 11:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLkOKp6d17b3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2025 11:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=rbmarliere@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33E5E40D28
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=marliere.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E5E40D28
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2025 header.b=Vfb9XVD5
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 33E5E40D28
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 11:52:20 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-221057b6ac4so13382215ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 03:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740052340; x=1740657140;
        h=in-reply-to:references:cc:subject:to:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyJ48cEBf3ybJXcCwpkQTA9L9UCk0AqM1gKaY3xOrqs=;
        b=YWIX/SaJtNAmDeWuAJZPwqIpwSnlsfkrUCJVUjNd8m5ecQ01WhJUFMejL+63yjarj9
         OhkwjpkMOkuBVuRE8WKRwM7/hoPnA384u3dff6dO/RBQCPnHiI8Tb2cOs8amW6QsdKWJ
         YA0PEmwXrc2CAfs8A5geWNuiuKVD7F08lYgPnV7U4h0oVDsP2y+ZRl+6QIcOLFhFKwJA
         GxBvkGMiErSLySlVy3PcQphovgctvstImajrQ3XKfHnK94QuK//7QqTyR88W9yHN7Wej
         MTzB1thLnRxjOvXHOlORQ7PYVE9HgtV7LlS+AeQiqDw+XnSBCFR38YwPNtFjF8Wmy5jK
         youQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt7C2jsHKswyzErxFdJlkPCe2R2t1ziZtUmquT5Ub8VUxUWdMVU4m2Ve9hFYXFo7yp3f7yoiQ8KdPtuOLEZ/aZfq7vaQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy2erUg5+jQxBM/52eT0QF0ekRXCmg0uRjxJBMoh570FRxK7+8n
	BntiyQpzM15dZbGnhw9DXod5V7YzmJPPfBT3BbAzy344SvwfgQ2q
X-Gm-Gg: ASbGnct93cZYUhxLDPYuAoIJ02TOt3GxRx+L/vpg7SrizLxnAHpL2gIxhQ/Zr3m7eDQ
	e08VM0/Wl+Lr/NH6+OrbzbFvS1RxiCzgnt+Mctw0k/ifvYxv1E3fGzMEgXBOIOPXIvjYBMKYvA3
	RRh5cK1cfdG7F4H4BjBhwi8uoU818QToZbybKcz0cbqEweFPs8XAlFgNJDrKYvErqNY23cLJN0w
	VBEoWZAOXQZLdeqFHlUZ3kIDDQ1fJiYGwoRtoyLnIcHgNz256r2XzQOPct2rHAyl8twx4Zs9iG5
	p0vJLaikAxXleKN27Ipx+ot1iBmCgaSw
X-Google-Smtp-Source: AGHT+IFlZ37sTtrXAFFHnJ1iBCOi+zyZ/E1NwHgnBT+x6hyKHVv35rYFShprGW7uHdq+ccHBl7Zgdw==
X-Received: by 2002:a05:6a21:3989:b0:1ee:dded:e5e with SMTP id adf61e73a8af0-1eedded1658mr10186421637.35.1740052340128;
        Thu, 20 Feb 2025 03:52:20 -0800 (PST)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adec4756d0csm6917539a12.55.2025.02.20.03.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 03:52:19 -0800 (PST)
From: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2025; t=1740052337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyJ48cEBf3ybJXcCwpkQTA9L9UCk0AqM1gKaY3xOrqs=;
	b=Vfb9XVD5Ky9trJ43YnNZ/rfYoDdKJ75IOVoMoNihtbXIkLDjxnGlOzA97+PLgzzZHKDlE9
	t7zNxFL8/sDmiNRC6U6s5Atz+wV4hMKBZOOgWu03FWeaL01+ZKStHPbWVNdb+ztO61/6Bh
	0J8JBY1miVRBPAW5zrXy9k7Fn2+eFsgNNDzLoD2p8mf3URWrZqj2KFEt/iAtNf2FGiblN7
	JMJTRyUazCUop+pyCM1+g5qHjQQ7ZEuf2N+EJKTJAOyUBV7qCUUefyuUr60wDjAzjhZvJf
	Ttdf0O9MPmQeCKkoEb3rVVj5bD6qyX1wZJcB6dYmr25EBMWbNgmeXJSHpO/2yg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Feb 2025 08:52:14 -0300
Message-Id: <D7X92MYPURFI.1BHED9UW00I82@marliere.net>
To: <ritvikfoss@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts/checksyscalls.sh: Add usage message, fix
 -Wno-error
Cc: <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20250220105940.5241-1-ritvikfoss@gmail.com>
In-Reply-To: <20250220105940.5241-1-ritvikfoss@gmail.com>

On Thu Feb 20, 2025 at 7:59 AM -03, ritvikfoss wrote:
> From: Ritvik Gupta <ritvikfoss@gmail.com>
>
> Currently 'scripts/checksyscalls.sh' does not
> provide guidance when executed without specifying
> a compiler, instead it attempts to execute
> '-Wno-error' parameter as a command,
> resulting in 'Wno-error: Command not found' error.
>
> This patch adds a usage message that is displayed
> when no compiler is provided as parameter to
> improve clarity.
>
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  scripts/checksyscalls.sh | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index 1e5d2eeb726d..14c04227c96e 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -10,6 +10,21 @@
>  # checksyscalls.sh gcc gcc-options
>  #
> =20
> +usage() {
> +cat <<EOF
> +Usage: $0 <compiler> [compiler-options]
> +
> +Example:
> +  $0 gcc
> +EOF
> +exit 1
> +}
> +
> +if [[ $# -eq 0 ]]; then

[[ is bash, while this script is POSIX #!/bin/sh

> +	echo "Error: No compiler provided."
> +	usage
> +fi
> +
>  ignore_list() {
>  cat << EOF
>  #include <asm/types.h>

