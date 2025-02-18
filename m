Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248124336D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739897073; cv=none; b=Gfuzfw19Chygyul+kM5b2o0oMdButNWViuzkQ31784iGfPGoPyTMqm/VLfQiMqv4lYXHxC9b2ogDJUb/9b+TG2Y5WHrNgYwLrydljTOq25APi+rOAgaPT9afxMFjgSEVSxinUe5lX+ILqz1iYQB5U2q3uyZxeblskYOHKpQUefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739897073; c=relaxed/simple;
	bh=acKv8l7utndNRoSH3+d9y7WD0hvnj6Oah/BQgu+2ZE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbMxNAlgF/2jXrBXngXjnqj21CFd0yq9ps0j5zylUpucmwejIMtyCoskvJEgFtVPCxqs7vdTryYD9AocYn+88Nxf+1AzO2v8snPu03Ed2YwNdJ6zhqHULu8KzXyCPK14DqhlxIcDaPyriacdBF+jxjOjMhXHzTahpGxpbeg2OfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKqrODMU; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKqrODMU"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3d297af33so2965157b6e.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739897071; x=1740501871; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aj3BO06Rec3K2MH9jNK8RjWlEKsE3RpWRiFSAdS0VJk=;
        b=KKqrODMUmAAPQh5JH88t2e599zKQ9RCPnciWB+9zZY439yPVKjrH5L4bEBl707ITMw
         cx/Yd+Rb0CWH1qRfeH7my/MVxGXMBYsAAWKpmVpHHLYWgXFKrX+rKWnBr41Y3QI+rdWb
         IM14UZX4mvtHqKXHYqrgt3QjnXO2LV9mjtaNu8gNxAaTdw7kJVU/xYy9ox1eFDUJB+Fb
         CmDNoDZvJjaKmBQ1oOdP2sUHd2jbgBY6KNB7N+IzyQynO/DAJjhk3X4v5YL55U/D0491
         axInA5APFIHKEfRFD3NpPw2WoAL7oSzKrZRFW81s/xwVEy2DL15SH8wPF3WrRQe68OEy
         4qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897071; x=1740501871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj3BO06Rec3K2MH9jNK8RjWlEKsE3RpWRiFSAdS0VJk=;
        b=js0WRFBBCmf0hZwgDTwsVPdNSrhPVCdIxw2MSPs+jf9G6eJcs03/KYauYsmT2+uCzi
         PFCK12TtD0kGh0Dc4u8Ci1jI2Z8cvcAMgsykzPwSXPhdqcgnos7kr6GBXfBz8mIBPRNm
         X6vqHSJOLkB4LUAAoxe1ztQytAATST31XQopFDhzBFnO1El2SY78HRek618nPGMi2Hnr
         vavim4hH+FVLvIVusxnA6o8JgV0Ku9Mmpq7mul05Ia0mDu2xsoRlXYl9CkT8rB/5qKLN
         ZeVtyKyHn/jX7gZ+B6BZnVdnjNsNAhMKaXrPdb+5UgXMWmC32WE57uu2jmwAaPhe6AZy
         TCFw==
X-Forwarded-Encrypted: i=1; AJvYcCWYe4TkwtrREQ5A36PJGOAWQrtKGziW486wmg7Sf9KzV3EvG+YA4tlX5i1DAlhebqzWn0cG+EVKlPKHOMJBhyFUIXrS6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXqzkbY17UEKrrCLIpnlQivgxp9Sf5y1imUSxKu1gaB5KVwCXU
	5m1OLCd6SDhpFNoN8DyIV+rXjKrB8ZJov3PRgYDismW3OMu/xZ7VOUaCruzqy/8sGRVcuyOvtOy
	bWKJKxijDP4KYdLkmVps2LwnO8rw=
X-Gm-Gg: ASbGncvAWGOEOjf3M6CeSaG1RXNZmuZV81KFVZHCTz2jxNM4TMMrAAmzww9RmBYdC39
	DCq0UDnBs+1UH0QgvroDhLJHCOKue/EFjxAe6biJMa8cWOHYEdBVIDjraVkxFrITIv5gCVwk=
X-Google-Smtp-Source: AGHT+IHGoyHEDM5CkZjt1a5evAAB5ebfx99us5PkEu2TpIfLACImFGBXuYj4qZi425trEd/vyEY4iDE2KGIbCOzcj40=
X-Received: by 2002:a05:6808:1791:b0:3f3:d88f:7d1e with SMTP id
 5614622812f47-3f3eb0f50c0mr11037721b6e.20.1739897071098; Tue, 18 Feb 2025
 08:44:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFggVh9LvJa_aH=dDBLrwBo8Ho4ZfYET3myExiqf0yfDCA@mail.gmail.com>
 <f5e6302e-f91a-4fc8-b12e-faebb7c26e05@kernel.org>
In-Reply-To: <f5e6302e-f91a-4fc8-b12e-faebb7c26e05@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 18 Feb 2025 22:14:19 +0530
X-Gm-Features: AWEUYZk0QBmdE5Kt03-t_deOrFiMdD3SAkcCR7YEut5kB6bOKJu_7EOvyxhmC8w
Message-ID: <CAO9wTFg17vQFj+dP8Qt5wqz4g+T+97B21nr1+z4bfvp5VKbQDQ@mail.gmail.com>
Subject: Re: [PATCH REPOST] selftests: net: Fix minor typos in MPTCP and
 psock_tpacket tests
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, kuba@kernel.org, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matthieu. I'm sorry I was using Gmail and I realized from the
documentation that it shouldn't be used. I've configured git
send-email and will send the patch using that. Apologies for any
inconvenience and thanks for the feedback.

On Tue, 18 Feb 2025 at 15:48, Matthieu Baerts <matttbe@kernel.org> wrote:
>
> Hi Suchit,
>
> On 18/02/2025 10:28, Suchit K wrote:
> > Fixes minor spelling errors:
> > - `simult_flows.sh`: "al testcases" -> "all testcases"
> > - `psock_tpacket.c`: "accross" -> "across"
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  tools/testing/selftests/net/mptcp/simult_flows.sh | 2 +-
> >  tools/testing/selftests/net/psock_tpacket.c       | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/net/mptcp/simult_flows.sh
> > b/tools/testing/selftests/net/mptcp/simult_flows.sh
>
> The patch is exactly the same as v1, containing the same issues: long
> lines are wrapped, corrupting the patch, like here above.
>
> > index 9c2a41597..2329c2f85 100755
> > --- a/tools/testing/selftests/net/mptcp/simult_flows.sh
> > +++ b/tools/testing/selftests/net/mptcp/simult_flows.sh
> > @@ -28,7 +28,7 @@ size=0
> >
> >  usage() {
> >   echo "Usage: $0 [ -b ] [ -c ] [ -d ] [ -i]"
> > - echo -e "\t-b: bail out after first error, otherwise runs al testcases"
> > + echo -e "\t-b: bail out after first error, otherwise runs all testcases"
> >   echo -e "\t-c: capture packets for each test using tcpdump (default:
> > no capture)"
>
> Same here
>
> >   echo -e "\t-d: debug this script"
> >   echo -e "\t-i: use 'ip mptcp' instead of 'pm_nl_ctl'"
> > diff --git a/tools/testing/selftests/net/psock_tpacket.c
> > b/tools/testing/selftests/net/psock_tpacket.c
>
> Same here
>
> > index 404a2ce75..221270cee 100644
> > --- a/tools/testing/selftests/net/psock_tpacket.c
> > +++ b/tools/testing/selftests/net/psock_tpacket.c
> > @@ -12,7 +12,7 @@
> >   *
> >   * Datapath:
> >   *   Open a pair of packet sockets and send resp. receive an a priori known
> > - *   packet pattern accross the sockets and check if it was received resp.
> > + *   packet pattern across the sockets and check if it was received resp.
> >   *   sent correctly. Fanout in combination with RX_RING is currently not
> >   *   tested here.
> >   *
>
> How are you sending this patch? Using 'git send-email' following
> instructions like the ones from [1]?
>
> I do recommend using b4 to prepare and send patches, see [2].
>
> [1] https://git-send-email.io
> [2] https://b4.docs.kernel.org/en/latest/contributor/overview.html
>
> Cheers,
> Matt
> --
> Sponsored by the NGI0 Core fund.
>
