Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637C2AF04
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740213462; cv=none; b=l9qREEfYk0/lTWAlAnCJbuzSh8pwNBGsKDNFEBuJXNeshvQizHZncCoBz6RlJTAX1HnsSAxMDFzPLtPHI0XtC4XI8DxnRmJNC5nGzxziNpVW3JOLB4AYHXoeUXhn/A79m9wMl6vMoLDyznwoGvle9K81aURSyOAcQZntVUpRW+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740213462; c=relaxed/simple;
	bh=nOFJ3LwKB+/xU1Kb8aDPrTi5hFqyakWbqSiqeaUVO44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix8ZiJbL4nyhl2ulAkALoWVphWbip44Ycb8t6ZmIf2DQ+THdiZYA2S/Psa49UFQxYmBcFZWT8EkSlTCdvvScHhcFuOGrLj8sxIA0upgzN2kR5ypt+jjmBTQePLeBLSm9x3jrVdG1NMhIQurjIPtFVIf2BsnCSvsGulq8ERLPYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m7SmmnAT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m7SmmnAT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB2081F4B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 08:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ryd_49HfzvKr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2025 08:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6009481F42
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6009481F42
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m7SmmnAT
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6009481F42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 08:37:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 147236116C;
	Sat, 22 Feb 2025 08:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A48CC4CED1;
	Sat, 22 Feb 2025 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740213457;
	bh=nOFJ3LwKB+/xU1Kb8aDPrTi5hFqyakWbqSiqeaUVO44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7SmmnAThqpY79p6an7hgde6ZVrsEFrw/a4A0kGGIaYwBDyMhGxs7sOuh30dDfN6G
	 t0N0ZOm1eqxRroBB7vsfP5TiQNFDhVJQCWufYxMSlv78R5JSqW5tTzZg3QvKNNf2vT
	 pUwHtVdnKYNq4Q8Z8yiydfCCZHHpSff+8ACGriW8=
Date: Sat, 22 Feb 2025 09:36:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ritvikfoss@gmail.com
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/mount: Explicitly define buffer size
Message-ID: <2025022257-easter-shower-61df@gregkh>
References: <20250222081711.48208-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222081711.48208-1-ritvikfoss@gmail.com>

On Sat, Feb 22, 2025 at 01:47:11PM +0530, ritvikfoss@gmail.com wrote:
> From: Ritvik Gupta <ritvikfoss@gmail.com>
> 
> Define macro ('MAX_BUF_SIZE') for buffer size
> instead of hardcoded value '4096', to improve
> readability.
> 
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  tools/testing/selftests/mount/unprivileged-remount-test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
> index d2917054fe3a..67a550b7c69b 100644
> --- a/tools/testing/selftests/mount/unprivileged-remount-test.c
> +++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
> @@ -45,6 +45,8 @@
>  # define MS_STRICTATIME (1 << 24)
>  #endif
>  
> +#define MAX_BUF_SIZE 4096
> +
>  static void die(char *fmt, ...)
>  {
>  	va_list ap;
> @@ -56,7 +58,7 @@ static void die(char *fmt, ...)
>  
>  static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list ap)
>  {
> -	char buf[4096];
> +	char buf[MAX_BUF_SIZE];

As this is only used once, why is a #define really needed at all?  Only
do that if it makes sense (i.e. is checked in different places.)

thanks,

greg k-h
