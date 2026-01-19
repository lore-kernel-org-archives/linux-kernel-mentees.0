Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90037998F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832141; cv=none; b=cU2Kjk7DBOJkASv32tO9lXXO+s1ZFEV6XRejXjz9KIftSFVfOQKB3I6XAnrINU36TFBrzx//kE/dRPIqfkp4dG7Cyyuep6JtuQyuMLSbC9Db6LyJHAm9uaV9w8DGl42+gTFv1RrS7gWiZ7u8EFppYPaIL6hRkgzhgD61qnPmCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832141; c=relaxed/simple;
	bh=R+/bv4ipRXok3lAyR1SltVmTZaoT5QY+uMnDvGbmgiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NS6BLyBvjV1Qz6+J4K+EN1ATujY24udMlG+IJRLSgJDDlXeMGzI+F2X5lU1cs1CGea9w9rmPB0haP+NRgqNAdWiqiTMHTp4nn+D9Yq9sGEX+ZbVPedUcaiC1VRN3bXIgp3RJvSF8as5nI4w75Z7BeQXFJcWbGNtN+MQlJxkGif8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACGZX3JB; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACGZX3JB"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5AC440B7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 14:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fI5whOkFsELN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jan 2026 14:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=suchitkarunakaran@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C66A040168
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C66A040168
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ACGZX3JB
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C66A040168
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 14:15:36 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so2455695fac.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768832135; x=1769436935; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tU4YxzrUfjLpNiqIrulQXSNi7dUTVOrfyQzI6Uhz7NE=;
        b=ACGZX3JBVgl2Xr21u2y7nEiE+sWPUHgU9c6Xezicb3OAPN78s1Wp9E7xLNK+1Gfyfx
         weMgXXDObgIxkhVVmdQ/Qu1AVQDztXGrity21Z7Q3U8wiwMeHzQfo+Zn6I4dASulUrsq
         7t6fiQCYgCS4KW+eJVEu5gcU6NKUPpJy1aMBUEO7sy+GTBMfXc2hlwjWrqzF6UE201ni
         QIafdPERrLnELf3z3Htj5eDQtBgBzaDVXxgxIiEizdEIkYBrqZ3CJyHnJ4ajH82ZdDLJ
         jrY1MM5AlTn0ykfAEcMCPdJQoP+Lei/OBrxjbY0MoPLnhNrMllyuOP+cZ7SbOxLqGI+d
         Zz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832135; x=1769436935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU4YxzrUfjLpNiqIrulQXSNi7dUTVOrfyQzI6Uhz7NE=;
        b=wLfzFCUSNwO+tYu9IqrVjeQxJWCG0pkpSouYGymHS9H+44xIaPNLHPOiG52Q4Rnhyf
         kzzWxSMaha/Jv/XV8J6u/7G2NN6Fj/SKt5v04isQfa+i348SfuJqYmsR/w+kk9Fj0RFR
         bhEuE1qRwxy7U2+3httA6wXxUCuZ++SruFyIirVBblkVIUjSZ3HVW52vdNecYD3uAVPN
         qOTPQaimaC9vXiMM51QJ4dxK8KAuLYJsFTL624s5GWYCAwdY/+xlhu7oAnZyv7Vt6YKF
         ugjaPJMJI5fTyMJfcaLNgaovj3l89e0Kcc0+EGeDKfSkc9VfMi/GvSEnr9yMx4FFo3nV
         h+oA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Xx2zZa3xBXcWxi7YnfOkpvD0hgolKbEXRJM/mqEgtvQn0ftaIb8kq6jwG4uGg5mdwOIHPdCB2PReMBQTmOUpfiWcoQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yygt51J+rbGWtI5PL6hFBlKbCId6FjUkvkbGz9JNRh0AFyop2tz
	g0+YCauJPyCNemP5dQM8KItGuerfhg0Ba9cJk2193Ra5C1k5ZtNEWvQdNgnP2/Aqg4d/eMcyWEM
	VRH4tNzJq+MgyuSYaLJUXBJHVBX3Ora0=
X-Gm-Gg: AZuq6aK0FmN84t1PiAi+q0hRDTh6bstR+eSrvDUMPXIu4TjuwtrNJifUz124ivTVAbO
	hwTe+/NehPHXNPpG1x/TsRPjdeEjOMmkxgrdFGb0wcxe4C2UGHMrX0tSn8VxkUkDt5LUCw2XzqP
	Vy3YS4xfBU1aYrrhttEhY3bSc1izSDI+YQ1HufplNr8Eqk1PiUy+6bgNSF+JFWYOCAhkOzsl/BQ
	zLj5tmKoHNg2KPVPfYOktz0HT9w7QKGoW1+5OSydo8fhbvn15t6BZjmmcGVW/SrLFTzVeCv
X-Received: by 2002:a05:6870:d370:b0:3ec:3464:6a01 with SMTP id
 586e51a60fabf-4044c21be51mr5678202fac.22.1768832135308; Mon, 19 Jan 2026
 06:15:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119135638.14531-1-giorgitchankvetadze1997@gmail.com>
In-Reply-To: <20260119135638.14531-1-giorgitchankvetadze1997@gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 19 Jan 2026 19:45:24 +0530
X-Gm-Features: AZwV_QiIPwAw3O75lZywyshKLt-6bCDmFUg_k3YcfsX2snm-cYrgLiIsiwjFtjs
Message-ID: <CAO9wTFiwEmzaRO16FXw45MkaYEm_HGke+eDr+b1w=LJu6mbx5w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add -giorgi-lkmp to EXTRAVERSION
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Jan 2026 at 19:27, Giorgi Tchankvetadze
<giorgitchankvetadze1997@gmail.com> wrote:
>
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 1465f7157..e1527f8dc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 6
>  PATCHLEVEL = 19
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc6
> +EXTRAVERSION = -giorgi-lkmp
>  NAME = Baby Opossum Posse
>
>  # *DOCUMENTATION*
> --
> 2.52.0
>
>

Hi Giorgi,
The changes in this patch are not suitable for inclusion in the
mainline. The EXTRAVERSION field is reserved for release candidates'
versions and should not be used to add personal identifiers.
