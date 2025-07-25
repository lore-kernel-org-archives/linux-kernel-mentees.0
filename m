Received: from fgw23-4.mail.saunalahti.fi (fgw23-4.mail.saunalahti.fi [62.142.5.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E281E2459CF
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753453406; cv=none; b=S5OH5kuq8L5CYHzy9S8Tqjiqi2bxysDq2OwTsURKDA5kgmyaC406G/2uW6le1zxk8QZmIocNBBd8dD9Xb5lMMB9+B96VuHjZifzBpfSnvuhGrqn7bInamcHc2dW+PQrEneW8xzLnCsajLOgB5FVjmuc5eGj+uWcljQUalTgp6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753453406; c=relaxed/simple;
	bh=ajb2/mWlyP9UNR3Xs3PMINrIeFwOZXII+MmwsFew3IQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=O6iaQ2AOppnJBnlHk3VbfY2djKeHTezcDtBKeDUEzmbacAPhnrIEehEC4dnDuDmTGvQyoKUY4f92frLDfi3CGydzyprie8R39HqmUAjm0chQQa4uIO7DBaHXj02qvp6/GppzM+DJIklrcRXUFu9nXyNm896mtsEcGwwywaCnf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kolumbus.fi; spf=pass smtp.mailfrom=kolumbus.fi; dkim=pass (2048-bit key) header.d=kolumbus.fi header.i=@kolumbus.fi header.b=woeGkEMr; arc=none smtp.client-ip=62.142.5.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kolumbus.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kolumbus.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kolumbus.fi header.i=@kolumbus.fi header.b="woeGkEMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kolumbus.fi; s=elisa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:feedback-id:from:to:cc:reply-to:subject:date:
	 in-reply-to:references:list-archive:list-subscribe:list-unsubscribe:
	 content-type:content-transfer-encoding:message-id;
	bh=YWQEaTI19svUHOi7Hio8DzdqycarOL3A3oVoeQgeEng=;
	b=woeGkEMrOxJckpvvAfH4JJavDV2CtmAf5Evtcgu1JOqLkx49ugL6b5oKFHthXQJROKpbCHVXbJ/YW
	 fyJkl/hJ58QBDtX9cABylWC0PTYNmxPblAIrFqiTEjcJ/N/iUKg6hV+fbnpVao18hW+a+rxtqk13TE
	 9eCxW+ArtKZik+zDZsr++brj8IyepPJwHhfyJg/vPWhhIomtMuRD+IAONmjYE+3QpJ69fO2wZTq/N9
	 4yagLzKqabYSv4ENogyDxbOHAOLFlkTDmyJ7lRjNSbZWffV2fxg2TG3F7zHXs/Qh2Bp7xWBVAQeCrm
	 6qyuSCRCd1FbZaWwt5rVvLkYb8syDaQ==
Feedback-ID: 5c3835a5:74d1b5:smtpa:elisa
Received: from smtpclient.apple (85-156-116-90.elisa-laajakaista.fi [85.156.116.90])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTPSA
	id e2445e5d-6962-11f0-aa56-005056bdfda7;
	Fri, 25 Jul 2025 17:23:08 +0300 (EEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] scsi:st.c replace snprintf() with sysfs_emit()
From: =?utf-8?B?IkthaSBNw6RraXNhcmEgKEtvbHVtYnVzKSI=?= <kai.makisara@kolumbus.fi>
In-Reply-To: <CAG+54DbmHbw4MWUSF3x1qQC4bF7Uuu8mDD7aAZyBtbJ1D51MUw@mail.gmail.com>
Date: Fri, 25 Jul 2025 17:22:57 +0300
Cc: James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linux.dev,
 bvanassche@acm.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA11A711-6652-4A0C-A890-38FAC7D518A2@kolumbus.fi>
References: <CAG+54DbmHbw4MWUSF3x1qQC4bF7Uuu8mDD7aAZyBtbJ1D51MUw@mail.gmail.com>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)


> On 24. Jul 2025, at 3.58, Rujra Bhatt <braker.noob.kernel@gmail.com> =
wrote:
>=20
> replace snprintf() with sysfs_emit() or sysfs_emit_at() in st.c file =
to
> follow kernel's guidelines from Documentation/filesystems/sysfs.rst
> This improves safety, consistency and easier to maintain and update it
> in the future.
>=20
Bart already wrote that these changes are required for existing drivers. =
I am a little hesitant about these kind of changes that don't fix =
anything  and don't add improvements. Any changes risk breaking =
something.

But, since I have wondered what these sysfs_emit* functions do, I =
decided to take a look...

> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
> drivers/scsi/st.c | 42 +++++++++++++++++++++---------------------
> 1 file changed, 21 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
> index 74a6830b7ed8..38badba472d7 100644
> --- a/drivers/scsi/st.c
> +++ b/drivers/scsi/st.c
> @@ -4564,25 +4564,25 @@ module_exit(exit_st);
> /* The sysfs driver interface. Read-only at the moment */
> static ssize_t try_direct_io_show(struct device_driver *ddp, char =
*buf)
> {
> -       return scnprintf(buf, PAGE_SIZE, "%d\n", try_direct_io);
> +       return sysfs_emit_at(buf, PAGE_SIZE, "%d\n", try_direct_io);

This "maps back" to vscnprintf(buf + PAGE_SIZE, 0, "%d\n", =
try_direct_io), which does not match the existing code (i.e., would =
return nothing). (Actually the problem is caught already by the check at =
the beginning of sysfs_emit_at()).

I am not happy to find out that this patch seems not to have been tested =
before submission. (Well, maybe compile tested.)

Kai

