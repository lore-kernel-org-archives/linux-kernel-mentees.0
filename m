Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621B2F12C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Dec 2025 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767080536; cv=none; b=TZ1J60qQwHIc6ICLjCGeGBWyIlUFJpRX5yczJxo3kRzSMspsP/IUKraz8nbuI/dKddIYfjlfMQXA7OV53u+PkedwKZU4rxtj3Yd5IssSLj1mVhRbMWUb1psECnc2Ynl/0cldQVyUGQakV88OTtR3ttRk4B9CFMSGaHRxE0Prm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767080536; c=relaxed/simple;
	bh=EK7xRaZTeENFTZbLetkczIs6qxysFgja/Qink8l/jt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA87oeEDo8Wma05wJmF5iTCDBELAEh4OBub84F+Q61ErWmg6t6KsePhp34V/QMkoyCvUNmQFBIBA5cYa6puBc29giRQr0zu3OSrbyu8aCPMYDg8caaABIjvpv+zY0TBEzqDlhm8XQte76Bao0ABpJd4hVaUmkkD9Fw9yIhIMoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MhwTzcoh; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MhwTzcoh"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B455606EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Dec 2025 07:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgMSa8mYFK7p for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Dec 2025 07:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C8EA606E3
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C8EA606E3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MhwTzcoh
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6C8EA606E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Dec 2025 07:42:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E776F6000A;
	Tue, 30 Dec 2025 07:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44671C4CEFB;
	Tue, 30 Dec 2025 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767080532;
	bh=EK7xRaZTeENFTZbLetkczIs6qxysFgja/Qink8l/jt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhwTzcohTSocPm75jgLItw43vuH3dzgTlCHz7suPZbMBazLu1BNDEwgKyiIdbE4Sb
	 CW+nsjiTBs0srsco+0dUuImyZHhY+47oiQjeD/3qsvBVTVVC/cf/F8h+WOxQ4gCPx9
	 92DErX35cAj64jVJQIB+d1L8azFPjpz6+NA0Vglg=
Date: Tue, 30 Dec 2025 08:42:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: MottiKumar <mottikumarbabu@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix const array warning
Message-ID: <2025123055-procurer-prodigal-27b6@gregkh>
References: <20251226120417.2599020-1-mottikumarbabu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226120417.2599020-1-mottikumarbabu@gmail.com>

On Fri, Dec 26, 2025 at 05:34:17PM +0530, MottiKumar wrote:
> Add a missing const to g_fbmode to fix a checkpatch warning:
> "static const char * array should probably be static const char * const"
> 
> Signed-off-by: MottiKumar <mottikumarbabu@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index d100b9e1d3d5..7afb58561a0c 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};
>  static const char *g_def_fbmode = "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview;
> -- 
> 2.43.0
> 
> 

Did you test build this change?  If not, please do so.

thanks,

greg k-h
