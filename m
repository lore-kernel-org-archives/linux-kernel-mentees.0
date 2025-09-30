Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDC1E8329
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759234671; cv=none; b=UIdzgElNsNsHlVfLw5IPPniNtcayr0mV+URGWeKKm3wUV7tu8iMeZaajyrSMr8yZIYwni96WLwQvwbq/zJYFusJ/wB0jMISZAhHGO3ClFoxMcxqmEZr+NDAAoJixZ4znpd20T4/4e/U0T/+RkGaw5JG7zgi88Fv4wzugn3Tj0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759234671; c=relaxed/simple;
	bh=VHokw67CdgFAtqIT9gbSPmXGbEZnYlUYjM8nB1HQdSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrenWsQkKpxNWKZDxrtoLTX3LaHRXTYnH8p1aEPhj4pNmMNYathZoSu3L1LIWbaaE8AkIQndBUc4YF3vpi6UDphwr4WaA5m6Od8yI4tCnaFgY/wUGRLTvmvBL4qKY7+5VIlKVZUHGlDX8ePZoqvwd5wi/hHKquQp+azn2ztMPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wjE8c/Dz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wjE8c/Dz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3651781DF0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 12:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lEowSp4X_gh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 12:17:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=edumazet@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4230D81DF9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4230D81DF9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wjE8c/Dz
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4230D81DF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 12:17:49 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-856701dc22aso575199185a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759234668; x=1759839468; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSuI/2n+ew39i77zlFplpKQQagEVttc/hT1Gph1V8P8=;
        b=wjE8c/Dz2WtO5cVc+3L7LEf1UOlZMsZuyzH/QF0aN+dxVZPl3onmES8ZlgcjesHb0U
         Ce5hegtTBPX/jUYBmuwAdRC+scfe8NoL96EDe7OWwTkZuDI74t1oc6xEiKNUVQ3QXZn5
         +wVmTvkjpO1/0KsxWjbE1KZa+7VPBl+UoE1lGFbx95VS4T25kdiBBmCNt8S4mn+FtTyY
         NZTQelDuxDc/BSg6TEfb7hgXvFMLD/BCiR13xvU/nVn+jAzDzatOLZ15rnlaHguOMrv1
         ProzJlJNuicLMKrcjCX16s4nAxjeu3MXyG8A9ORP1b3E8WLSZepSCocUpoPt7yjoY7EU
         aBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234668; x=1759839468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSuI/2n+ew39i77zlFplpKQQagEVttc/hT1Gph1V8P8=;
        b=OC8TIxdxnYWOGb4ah2o9/LJXZxyk54Os9l+Zsoh+nDkIhbTzlH4GW5B4BN/Frlf/98
         FKRBQlkxuHMhDBD9VeOJrAUB4AfChsPYL5t83NyLzfMB4dFPyxE/GDbNYshEbYaf0TAa
         7kBqRHgR1sC7s8FZDpSZKWD1wSnqxt9k3bwRBSZM9gtaBDqQCrTJswq0kKA4B5oj4V5w
         wPboAzGqi2xtdyCYyQU+A767b03vi328gs3mMBlBP7hHZ8u5Z4t2UhC+4ElaJCPMDQKg
         ZmXcU5cQNwl0Bt1NJiGjTIs6ZMIJkAdajm7rNAgggq9pKeK/eRPHRVCzwEukywZaZ3jH
         BIBw==
X-Forwarded-Encrypted: i=1; AJvYcCXMuSbfn0Tt8nNDcNoGFKbXV4OImp1buojvpRbRT1yql7dtb8fuuQCJ1/fypuEcW5rwvAJuNzFo5xA7yDp0oa3025jevQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw6tOx0buIfOEG2cYWxw7eIQFaVvv4MLhyqCJueLQjO798lkSzR
	CtmQ5lQX7dvCT6Tzin2ndy7c79VIm0LGjTzIM8trJChXSUe8tdIJAnb6s8UjuxNp6z72m85ZF6C
	pfj9erlkNtwb5rUmvCCS0huw+a2eS/z+QcsF5RZ8r
X-Gm-Gg: ASbGncvz1vL4kghXt8pT/rzV6QxyaPKYOWDgHgUq9YqzRFfSlIqYNhtx/ggeGD8HSh+
	ppkQK2Cgw8KT5baec6lxPRfbYrpJieCYDYhL1Ud0/Vj8OWWZY5tx1eV3s4oIC+UZQLpyZr4UsOY
	QoqqO95XAFdcBDyVP3/bsWNw2KR4QvrpGtWRatNaCKqmk5XanHlUdNRx0282dHt5CWZeozDhBnL
	fZPDDEZ/b2ExdDydmyGHx4G1SUIY31ME7df
X-Google-Smtp-Source: AGHT+IHweQOJiof85AA5jV2ZEcHNzj+gXAYXM1FIk+oPmrA14lD78g9olEBwYhQHTk+UGfF5KNCd/iE8rLKjaDCd7Is=
X-Received: by 2002:a05:620a:a203:b0:85c:d089:41d8 with SMTP id
 af79cd13be357-85cd08944a4mr2540228385a.23.1759234667156; Tue, 30 Sep 2025
 05:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250930111933.28730-1-bhanuseshukumar@gmail.com>
 <b0cdffc2-7db2-4aee-aca7-ddb068d5022a@gmail.com> <68484d2e-653a-4256-bd99-47f1a9b740f8@gmail.com>
In-Reply-To: <68484d2e-653a-4256-bd99-47f1a9b740f8@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 30 Sep 2025 05:17:36 -0700
X-Gm-Features: AS18NWDi4qIfOYRq7HnftAh7o1oMFXHxZUf32YqtMcw0aj-_os4j09xctlVr-B4
Message-ID: <CANn89iJpvsB55vbTmZiDV=8H6xQ=dVtAZJsGo9f_4nrfZfCcJA@mail.gmail.com>
Subject: Re: [PATCH] net: atlantic: Use kmalloc_array to prevent overflow of
 dynamic size calculation
To: bhanuseshukumar <bhanuseshukumar@gmail.com>
Cc: Sahil Chandna <chandna.linuxkernel@gmail.com>, epomozov@marvell.com, 
	irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 4:39=E2=80=AFAM bhanuseshukumar
<bhanuseshukumar@gmail.com> wrote:
>
> On 30/09/25 16:54, Sahil Chandna wrote:
> > On 30/09/2025 16:49, Bhanu Seshu Kumar Valluri wrote:
> >> Use kmalloc_array to avoid potential overflow during dynamic size calc=
ulation
> >> inside kmalloc.
> >>
> >> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> >> ---
> >>   Note: Patch is tested for compilation.
> >>   drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers=
/net/ethernet/aquantia/atlantic/aq_ptp.c
> >> index 5acb3e16b567..f445d449f80f 100644
> >> --- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
> >> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
> >> @@ -182,7 +182,7 @@ static unsigned int aq_ptp_skb_buf_len(struct ptp_=
skb_ring *ring)
> >>     static int aq_ptp_skb_ring_init(struct ptp_skb_ring *ring, unsigne=
d int size)
> >>   {
> >> -    struct sk_buff **buff =3D kmalloc(sizeof(*buff) * size, GFP_KERNE=
L);
> >> +    struct sk_buff **buff =3D kmalloc_array(sizeof(*buff), size, GFP_=
KERNEL);
> >>
> > Shouldn't this be kmalloc_array(size, sizeof(*buff), GFP_KERNEL); ?
>
> I didn't change the order of arguments to make it easier to review.

I think this NIC limits the number of skbs per queue to less than 8192.

Also sizeof(struct sk_buff *) is quite small (a pointer is 8 or 4 bytes)

So your patch would probably target net-next as a cleanup, in about
two weeks when the merge window is over.

More details in
https://www.kernel.org/doc/Documentation/process/maintainer-netdev.rst

Thanks.
