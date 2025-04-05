Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3665695
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874137; cv=none; b=Uqg4t9dtOkssKhSmRqnGT2tqacGjbcnAeKYDRImdVpun05aapxNdwbi47KST3xerf9nJcKu+M9sqMI2pTCawgHqCq3YyJzXHuBULIapr9AWm279Wam0EyNJtxURCo5dAhrJUIla07a9hLQ2xZYXtQBkFo8/hm6KEdX/sEUmkqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874137; c=relaxed/simple;
	bh=zj/fmiI253uvBAVahnE/+QFJ/fun3Lssp1wjLuyp634=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkgYJJE+zo1Yq5ThcJr5OqXsQOMr/kaB/mEHP3wYJncQMrFJutlOnjavUsbgxIr1Ddc1Fs1FOMuYR+TY1A652i6rNsgMr3fojHPXU70VPWzJ6R1q5ETHdJh2+N9c8R3neOXLvzeEXrQV8nLb5VNzxjaVSWhWLob3bCCwBKXOnrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAAg2f0n; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAAg2f0n"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-700b17551cdso29819167b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743874134; x=1744478934; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jW1xAus8FHDpywvQBlSsYf1NBRChzXtls8jPIo8+8H0=;
        b=ZAAg2f0nozUQTPTT0wO4L+R1qM2qIYIJ8U5Za7+zOf2rODcpsoD7KrWHVU3lmZ0FbM
         KuZXVuJ3AkIxn58v1uGtK6ku6TTufXKGS6d3GyIqNRgWItGcnNRj9o6zwfU14DNrbDOZ
         BJbVEUulTZaBfc8nO833cRXtWHHM46uULnSdEj/EYrwlpozkzJlbFX88fkUL51R5U3+g
         qs64B6OscWit1IsqsLoO8MCZBAcLNnQ952gpsJBmbTSvEeWaoFkH0LwQ+WSETtkSVGg9
         HPjKZJnijcUboOMIqqyGa3qBzlKcaotghf7ivSFAfFsE94mv2EE7RG5e8u0gOQWwOnlS
         FXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743874134; x=1744478934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW1xAus8FHDpywvQBlSsYf1NBRChzXtls8jPIo8+8H0=;
        b=PRcHJvRGqVtDsZcDDhxJKn5ZbqV21Ds81+Fi8LsvrlslTGOjTU4nzEk9CEeGyP68kx
         VJImAP5BdyzvI4Zl9Ak2UGqEOJbk8WkcJChKMNjswmxgmx8AkbMATylSD6KMnYnJLejg
         wnuQyQqwiXChkgmw88nnD2Hh0dX274Pt5R7hhtDv0dLN2fH22s8tu+/p8Si4R3DbRiBn
         pp6qo+tVMGWsBoQF6aRSH4cmcCUGEQn8zRF+FApMTeXSIQFH0DHhxmJw+bd4wWMyJr+R
         3BlblTwoG9eRdoHX3CrSRf9i7So2BTzMqVS3QUs9Dg2b0V1T0/7MrskEyfc23FGFs4C0
         sKBw==
X-Forwarded-Encrypted: i=1; AJvYcCVS8E+GMbI+gxm5ZcV/Gf9nxWvvFlt3rtggFPrrbT0rOwBHGTgvfRJQ02w3G4lM/UJc0EX/Jtc0/YhXU4hvSJBWdLBeCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPkJbFvppv0Ozh7ofJ1q+/5w8GcvtmCl6E0f9fsJksGk0pp3/H
	4mnCEOiClSAXux4I4++SsK8Ce3LaJfsI2FmhyQn8ccBzrhgx82HZRL1IENVIVxRETodCMniOGTe
	bMRaFnbBvHAVEc7w0MY4LskZ3bUg=
X-Gm-Gg: ASbGnctPJx5Oo81ajKWcDxjvZnRclVqd5c+ZPm7qmU0HgxI99QSTU+MxD5JpqUdd7Tm
	RXv2XakZYBPZEwjMSZ6W3Ao/DHTRNbj+aj3MOAAL5JYZIHlmNJQpQv4Fvq9QtgulWRtAlBLAyJB
	qsjSECL5zOhaHwo5v7NY1Pzj14
X-Google-Smtp-Source: AGHT+IESo5T95fFyvW3R59tyJsVhxEya1iUHOTcTxLLMetNdAkOMzfreJMAvHRkABNsC5C5mnlH10P5ER6FbNPfqX1I=
X-Received: by 2002:a05:690c:6d02:b0:6fd:a226:fb4c with SMTP id
 00721157ae682-703e154f5a0mr132981617b3.15.1743874134572; Sat, 05 Apr 2025
 10:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402204554.205560-1-goralbaris@gmail.com> <20250405143646.10722-1-goralbaris@gmail.com>
 <20250405162548.310dea37@pumpkin> <CAJOJxizEDm_th4G=BvejM4_jGcF6+QYT=LjD_J_FTbsNFVTjCQ@mail.gmail.com>
In-Reply-To: <CAJOJxizEDm_th4G=BvejM4_jGcF6+QYT=LjD_J_FTbsNFVTjCQ@mail.gmail.com>
From: baris goral <goralbaris@gmail.com>
Date: Sat, 5 Apr 2025 20:28:42 +0300
X-Gm-Features: ATxdqUFXJGOJznQfdtlC7tZTYAw3xNF7XEDd6qaqt_Ax-jNxnhVZ9v2lAxz3u3E
Message-ID: <CAJOJxiyOZgRrf=e3tJuKiAdZP4U4MS4Y0EQFd5HPYAHgUhXVww@mail.gmail.com>
Subject: Re: [PATCH v4] scsi: target: transform strncpy into strscpy
To: David Laight <david.laight.linux@gmail.com>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Trying to understand, it has if check a few lines above:

if (count > (DB_ROOT_LEN - 1))

Does not it met our expectations?


Best Reagrds,
Baris


baris goral <goralbaris@gmail.com>, 5 Nis 2025 Cmt, 19:35 tarihinde =C5=9Fu=
nu yazd=C4=B1:
>
> Hi,
> Trying to understand, it has if check a few lines above:
>
> if (count > (DB_ROOT_LEN - 1))
>
> Does not it met our expectations?
>
>
> David Laight <david.laight.linux@gmail.com>, 5 Nis 2025 Cmt, 18:25 tarihi=
nde =C5=9Funu yazd=C4=B1:
>>
>> On Sat,  5 Apr 2025 17:36:47 +0300
>> Baris Can Goral <goralbaris@gmail.com> wrote:
>>
>> > The strncpy() function is actively dangerous to use since it may not
>> > NULL-terminate the destination string,resulting in potential memory
>> > content exposures, unbounded reads, or crashes.
>> >
>> > Link:https://github.com/KSPP/linux/issues/90
>> > Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
>> > ---
>> > Changes from v4:
>> >       -Description added
>> >       -User name corrected
>> >       -formatting issues.
>> >       -commit name changed
>> >  drivers/target/target_core_configfs.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/target/target_core_configfs.c b/drivers/target/ta=
rget_core_configfs.c
>> > index c40217f44b1b..5c0b74e76be2 100644
>> > --- a/drivers/target/target_core_configfs.c
>> > +++ b/drivers/target/target_core_configfs.c
>> > @@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struc=
t config_item *item,
>> >       }
>> >       filp_close(fp, NULL);
>> >
>> > -     strncpy(db_root, db_root_stage, read_bytes);
>> > +     strscpy(db_root, db_root_stage, read_bytes);
>> >       pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
>>
>> That code is broken, it reads:
>>         read_bytes =3D snprintf(db_root_stage, DB_ROOT_LEN, "%s", page);
>>         if (!read_bytes)
>>                 goto unlock;
>>
>>         if (db_root_stage[read_bytes - 1] =3D=3D '\n')
>>                 db_root_stage[read_bytes - 1] =3D '\0';
>>
>>         /* validate new db root before accepting it */
>>         fp =3D filp_open(db_root_stage, O_RDONLY, 0);
>>         if (IS_ERR(fp)) {
>>                 pr_err("db_root: cannot open: %s\n", db_root_stage);
>>                 goto unlock;
>>         }
>>         if (!S_ISDIR(file_inode(fp)->i_mode)) {
>>                 filp_close(fp, NULL);
>>                 pr_err("db_root: not a directory: %s\n", db_root_stage);
>>                 goto unlock;
>>         }
>>         filp_close(fp, NULL);
>>
>>         strncpy(db_root, db_root_stage, read_bytes);
>>         pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
>>
>>         r =3D read_bytes;
>>
>> unlock:
>>         mutex_unlock(&target_devices_lock);
>>         return r;
>>
>> 'Really nasty (tm)' things happen if 'page' is too long.
>>
>>         David
>>
>> >
>> >       r =3D read_bytes;
>> > @@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
>> >       }
>> >       filp_close(fp, NULL);
>> >
>> > -     strncpy(db_root, db_root_stage, DB_ROOT_LEN);
>> > +     strscpy(db_root, db_root_stage, DB_ROOT_LEN);
>> >       pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
>> >  }
>> >
>>
