Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415D1C32EC
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  4 Nov 2024 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737222; cv=none; b=uQabPaiR2m3QXfNjOEQbQeq8dBx2HC9jnkng+kEXsUqhT7MCmS86954SIhcIOry7oc8sGHzxdyMp4aBBB8IcCd5ACP6lZPOfNSQFxVzPn+X4evzybDGaTaQH0rsc1MUI5ZoNeWNq55caPpmFfiUBPaLFcGjx45DpWOt4TrEc9kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737222; c=relaxed/simple;
	bh=DxhaOPfKoLz2uC9aKp0uM0TtGsHNPcDML9iDcAKzt7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AE3mHfdM9YiPFdzpVKyv2tXS0eyRhe1kM/QOTtxGo+0lEibpYFOTtqSo0/9PphRFU1aHsH/Ls9NjqwZDTXbb/pB9U/5lp0dPhkwZMF8GwZCX6V7FEvIxWBD7pYymAdUHbKnqDWWzQbuiI3gDZ3B+mleI3pDAZ3Jm3bm0zcwtW3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHLWJc5W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHLWJc5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20628C4CED0
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  4 Nov 2024 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730737222;
	bh=DxhaOPfKoLz2uC9aKp0uM0TtGsHNPcDML9iDcAKzt7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sHLWJc5WE/qeOysHvvZhkAHqYWN4tbWCRdcUWbn9bT/pdUrKlN9y81VPWvDR5SJxV
	 8tio2fDAwAOxgnc/chsF8ngIjyf5/bdWbpOhXG9eH7l9TREZabOEX0dVo0iZaKGPHl
	 yycEOwGYBQwXTf8T/7RI8e64nMv/KZCSvs4joPvRztf0CCR+uQ1dmPfJnTwAD/LjeJ
	 Tze9JtLXDZIAzgO0epHAiD6O99JUBWA+mFKOqvbb+ceakW76dH8d6GY2OcFuBMXDd4
	 Nt62chfE3EqNzgjEojaVRW/JjI3excIaSEE6JLINPXGcvapFXgjTgJH4/ozbvnBTwV
	 MqJNbNTm/Laew==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-28847f4207dso1972730fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 04 Nov 2024 08:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGeJpKCqqckQ7E3smZnSfMxCAfglhcKYyTnyQxfhRj7BRgJLqx22mFzdJ5nbGfYzGCYlhJFNJEsY4Sr91WplvuRhz3DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT5IVUu3nGmxB1AL6sLAFPNecVk+U4vYdA5Z7qEPXPH3QscOtG
	Kl50LT9p126d8DYRJDkjkGmoRicp9p3Sth+pXUCRht/VlmvRPY67Y4s5lfRzLo6cIEjT0SBcvsm
	Mr5Q5wu4MLk1XjKIwKefZSqHRh38=
X-Google-Smtp-Source: AGHT+IFf4WD5U1Q607IIFaIyvF/k5k3uxxuk7F9lgmG54W9ALpQZiRlt/Q2lQGza9d878zL0uda1EJ6u9nDexYRXny0=
X-Received: by 2002:a05:6870:1d10:b0:278:25d:d473 with SMTP id
 586e51a60fabf-2948440d44emr12991862fac.1.1730737221463; Mon, 04 Nov 2024
 08:20:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101145241.10326-1-av2082000@gmail.com>
In-Reply-To: <20241101145241.10326-1-av2082000@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 4 Nov 2024 17:20:09 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h_yu6YHcYRPSOg5yrrvWd-Mv4+xYtU+XouP2APoydm+w@mail.gmail.com>
Message-ID: <CAJZ5v0h_yu6YHcYRPSOg5yrrvWd-Mv4+xYtU+XouP2APoydm+w@mail.gmail.com>
Subject: Re: [PATCH] pm-graph: Refactor installation script
To: Amit Vadhavana <av2082000@gmail.com>, todd.e.brandt@linux.intel.com
Cc: skhan@linuxfoundation.org, ricardo@marliere.net, 
	linux-kernel-mentees@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 3:53=E2=80=AFPM Amit Vadhavana <av2082000@gmail.com>=
 wrote:
>
> Change installation script to ensure that the terminal returns to the
> original directory after the installation process completes.
>
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> ---
>  tools/power/pm-graph/install_latest_from_github.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/power/pm-graph/install_latest_from_github.sh b/tools/p=
ower/pm-graph/install_latest_from_github.sh
> index eaa332399d36..aaf3515400ed 100755
> --- a/tools/power/pm-graph/install_latest_from_github.sh
> +++ b/tools/power/pm-graph/install_latest_from_github.sh
> @@ -4,6 +4,9 @@
>  # Script which clones and installs the latest pm-graph
>  # from http://github.com/intel/pm-graph.git
>
> +# Save the current directory
> +CURRENT_DIR=3D$(pwd)
> +
>  OUT=3D`mktemp -d 2>/dev/null`
>  if [ -z "$OUT" -o ! -e $OUT ]; then
>         echo "ERROR: mktemp failed to create folder"
> @@ -36,3 +39,6 @@ else
>         echo "INSTALL FAILED"
>  fi
>  cleanup
> +
> +# Return to the original directory
> +cd "$CURRENT_DIR"
> --

Todd, can you please let me know if this is OK?
