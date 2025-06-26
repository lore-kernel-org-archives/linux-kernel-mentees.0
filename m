Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35852EF9A5
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948345; cv=none; b=VLH8qj5JEvdONIodvU4yUuVAQSblsmg07aVd1/T2SPLMAbBs5lVl0XVGYbsk9uyg4T1QLOfD9FBh4WhP5IsGHWPPvQVjEkGJ/Y0t4Rf3ISl9PkoWbvYbM+Qo0foc+UxUWzmUcLzinKikw711v5jP/enYaKuUSYXZml6bTgq1jY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948345; c=relaxed/simple;
	bh=1jC/tGnvYZqIX1z6MW25LhIXH6ubgU5rEfdthqI9T7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyCloiGM27iZC5w8z0gxzz74VdOR7g93cTESePX442GpYk0noU9rKVYmybrFomhkRYsfvc+oZElH2YRllMMSlBdGvOJ2aD4Hy/hJWQwEA7E/e3yZAgNz8YtICpg7T+YfE3PTf9WVyZl69ROA439q+KjEI9dI0UVqIXyDS092xMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIGdj0Xe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIGdj0Xe"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553dceb345eso1057273e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750948342; x=1751553142; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ep8LpzklDdJ/PRT38YsBKJnMGg/9nUE3qJ238rNuc=;
        b=iIGdj0Xe4BoS/v6Xs/s6DJiiOIWfW5G+at3DPe8tTK8MnQBTjPhz8bV4Sx2p1L9fdc
         /RtulMrHX98jNKlcI4eoOcmWnbm+2noytB8xwLzDJq77tnHTcWpWmW01yavCnawkrpUH
         9WQqbREQGGuZOwayrEhIf5I01xsVocGTjDVP74mKu5VAa6ILFurPVyA6b8RLUbiivnqO
         KxlFH/BRptS+x3nL5AEpsN1LE0WIUX7UClMm39+3t1h6ky98BPUynqDeWeFPesK2FbKG
         x92++Ipvi/Xw9YJgVVRjpYQJsZRgtUMsIv3pPZX3vdziQj5BOaS71KCu7chWCGHucVxx
         5bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948342; x=1751553142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4ep8LpzklDdJ/PRT38YsBKJnMGg/9nUE3qJ238rNuc=;
        b=cWeUVTIjmwGC7G9oIWMv+c3D2jvMOuOoo0xODbmyyEilVj9e7jbQjZz+5vLTz3cO8f
         EV4hM/DgRcxXH+NPvrws6beQvoOodS94ttvkmm/mprf9/bWk5rXa00wDZ0jhpZlCHoRx
         YX7Ln/OXpO2Tiu/STAMy01GHvzwOix3yuEU+8UtDScsxbRRuzSkjFf52bAoqqav9pS1U
         9HohH5Tro/0NcaTxouRrJees2aESVTEkFM0DxPzIm3bbhZTBhGGEsSylbjKWasQRTU3b
         tTyd9yz33SYYbpyC+kozF5w5f4luOYtKc3MD+mhfrueoUx4V+AA2ZFEDJ0q2xuvPUrOL
         mKSA==
X-Forwarded-Encrypted: i=1; AJvYcCUnkicWss/9crhV7ObtmmEAorVYf7W1pVnbW5qovknFUq63YL/jVvYFbLKroixht2x+hNCjDFDuH2LpblKXx57OxSSGUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvYiMjzQSkksuwDQtCizQZEN06+JflDU8Bq2fIzznIG+xCUMCk
	wTVAuSd9Zj1rcHI95pohSsvhGA/AXhkOUj8EFRzQSf1OYmsXMH42muTgcDkNFkfpat75buDlp3p
	iHRGgVW8xpm74hOCqgLylCvhCzkktl5A=
X-Gm-Gg: ASbGncv+hVvfRj1DchD+k7uqL7Ku/VUXmThBKAlzdT2ObY6XywHySvG+LRXT3pYjhDo
	ULZez1q7PY4smnem8QUe49q+v9bXomW5Wj5n3C75/nU3rmMVcS0A/1atMznNFMJEklUxo7ZffI3
	AA37+AkMFK03tazJQz9RbDX5aHPsV54c1LQWODq1lq2w04hBGspY0sqbIiPC54NK/+EzeHyJ4ZG
	hpi2g==
X-Google-Smtp-Source: AGHT+IFx4sduEJGCHwL3U+pSB2Tg8LNQZ44ZqhdKUQhPbzhrEtPy2s8ZWPFPfbdHNZSYNd8FSRJALxpHY5AcPjo/atk=
X-Received: by 2002:ac2:568e:0:b0:553:2e0f:96c with SMTP id
 2adb3069b0e04-554fdd0e51fmr2690042e87.23.1750948341966; Thu, 26 Jun 2025
 07:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623083841.364002-1-pranav.tyagi03@gmail.com> <aFrBeCn-j_AB1yzv@rric.localdomain>
In-Reply-To: <aFrBeCn-j_AB1yzv@rric.localdomain>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:02:10 +0530
X-Gm-Features: Ac12FXysQiC9JCtpThr23nOptpbU1SVBPAIAYLzmUaBViKaSpsg8hiX7ofi6dBg
Message-ID: <CAH4c4jLAfMTn6wN3wJSOQZ3mAoYC3uhswDu6c+c6v-wv8mSifQ@mail.gmail.com>
Subject: Re: [PATCH v2] cxl/memdev: automate cleanup with __free()
To: Robert Richter <rrichter@amd.com>
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com, 
	alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com, 
	dan.j.williams@intel.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ming.li@zohomail.com, peterz@infradead.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 8:47=E2=80=AFPM Robert Richter <rrichter@amd.com> w=
rote:
>
> On 23.06.25 14:08:41, Pranav Tyagi wrote:
> > Use the scope based resource management (defined in linux/cleanup.h) to
> > automate the lifetime control of struct cxl_mbox_transfer_fw. This
> > eliminates explicit kfree() calls and makes the code more robust and
> > maintainable in presence of early returns.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  drivers/cxl/core/memdev.c | 21 ++++++++-------------
> >  1 file changed, 8 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/cxl/core/memdev.c b/drivers/cxl/core/memdev.c
> > index f88a13adf7fa..38f4449f9740 100644
> > --- a/drivers/cxl/core/memdev.c
> > +++ b/drivers/cxl/core/memdev.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/idr.h>
> >  #include <linux/pci.h>
> > +#include <linux/cleanup.h>
> >  #include <cxlmem.h>
> >  #include "trace.h"
> >  #include "core.h"
> > @@ -802,11 +803,10 @@ static int cxl_mem_activate_fw(struct cxl_memdev_=
state *mds, int slot)
> >  static int cxl_mem_abort_fw_xfer(struct cxl_memdev_state *mds)
> >  {
> >       struct cxl_mailbox *cxl_mbox =3D &mds->cxlds.cxl_mbox;
> > -     struct cxl_mbox_transfer_fw *transfer;
> >       struct cxl_mbox_cmd mbox_cmd;
> > -     int rc;
> > -
> > -     transfer =3D kzalloc(struct_size(transfer, data, 0), GFP_KERNEL);
> > +
> > +     struct cxl_mbox_transfer_fw *transfer __free(kfree) =3D
> > +             kzalloc(struct_size(transfer, data, 0), GFP_KERNEL);
>
> I don't see a reason for __free() here as there are no early exits.
>
> >       if (!transfer)
> >               return -ENOMEM;
> >
> > @@ -821,9 +821,7 @@ static int cxl_mem_abort_fw_xfer(struct cxl_memdev_=
state *mds)
> >
> >       transfer->action =3D CXL_FW_TRANSFER_ACTION_ABORT;
> >
> > -     rc =3D cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
> > -     kfree(transfer);
> > -     return rc;
> > +     return cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
> >  }
> >
> >  static void cxl_fw_cleanup(struct fw_upload *fwl)
> > @@ -880,7 +878,7 @@ static enum fw_upload_err cxl_fw_write(struct fw_up=
load *fwl, const u8 *data,
> >       struct cxl_dev_state *cxlds =3D &mds->cxlds;
> >       struct cxl_mailbox *cxl_mbox =3D &cxlds->cxl_mbox;
> >       struct cxl_memdev *cxlmd =3D cxlds->cxlmd;
> > -     struct cxl_mbox_transfer_fw *transfer;
> > +     struct cxl_mbox_transfer_fw *transfer __free(kfree);
>
> Jonathan already catched this.
>
> >       struct cxl_mbox_cmd mbox_cmd;
> >       u32 cur_size, remaining;
> >       size_t size_in;
> > @@ -949,7 +947,7 @@ static enum fw_upload_err cxl_fw_write(struct fw_up=
load *fwl, const u8 *data,
> >       rc =3D cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
> >       if (rc < 0) {
> >               rc =3D FW_UPLOAD_ERR_RW_ERROR;
> > -             goto out_free;
> > +             return rc;
>
> If you want to remove the goto here, just free transfer right after
> calling cxl_internal_send_cmd(). It is no longer used then.
>
> I only want those cleanup helpers where they are actually useful and
> do not just add complexity.
>
> Thanks,
>
> -Robert
>
> >       }
> >
> >       *written =3D cur_size;
> > @@ -963,14 +961,11 @@ static enum fw_upload_err cxl_fw_write(struct fw_=
upload *fwl, const u8 *data,
> >                       dev_err(&cxlmd->dev, "Error activating firmware: =
%d\n",
> >                               rc);
> >                       rc =3D FW_UPLOAD_ERR_HW_ERROR;
> > -                     goto out_free;
> > +                     return rc;
> >               }
> >       }
> >
> >       rc =3D FW_UPLOAD_ERR_NONE;
> > -
> > -out_free:
> > -     kfree(transfer);
> >       return rc;
> >  }
> >
> > --
> > 2.49.0
> >

Thank you for the feedback. I understand your concerns and completely
agree with your reasoning. Please pardon my misjudgment in sending this
patch. I am still a beginner with kernel development and learning to
better assess what makes a meaningful contribution.

Regards
Pranav Tyagi
