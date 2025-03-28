Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306414A0BC
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Mar 2025 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187671; cv=none; b=jIPoCRZIaH3RTqPFqsRBppL1mUTLcGVqgkLDNWnR5pP1xANK3kbozjfby11uv/0uqzaxT4WOyL/VzS90pIPJzhpBQKVgw2lpzBqsxmPgwqGihb5FjufnB+RCZFm+6SUBmwsavGlfNCNXUvE2cWEwxE2UCzHxka/77R5zJj/gPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187671; c=relaxed/simple;
	bh=GHOKahoG9CWMz1lQLck1AhqJdvINwU6zT5Zcdu6eHqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdiZKg2/yC4hQyIEZPKr+hXyysKLLHfJ7p7E1GWo193eccXH+u6YrqvXl5ZsTwbh4xAZQnG9U7OxXI1TA3rNSHDnWCWLEkI7pED1SZdLmUQeOyEzXIbLlyEmTpUdZrpfeehcPOa3yojfM17d/9uwSGPYr8YIlZhSTsUaa0VXLfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxk6efEN; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxk6efEN"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so529357a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Mar 2025 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743187669; x=1743792469; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZaBQSGCWBE4y8Yxfb/IZp7h2QC6U5lj6cYuHqPma8Y=;
        b=Jxk6efENzGZA8Mn8Zl7X+MvXXed/IGV/5K0r6eZriRawUSMlXr5xNEuTZsn4hR3l0T
         RUzspUs1KgUsB5g3J/oST2c0p2E8geKBosuBOlx4VovQ1ec8lev8zUiEb2JFAckamKYw
         /FHkNVLqbqa9NBYcdhZ5KOzK5GnJCbIpc6Tviz6d3PWMm5h3H1fJFQz7zsdRH4b5eK5f
         t1py2C+Tz+1Jw4RPOeKK5CWaxqZMyUTfM9ZTJeT7P7MSDtPtqSgTrnMYEzhTsE4FWdcV
         PdRLs3LVwKHPUiLfaV9mC65YoG+SMDOt5e+RiMNQjCEZ7BN2XhnqgjVE2qP1AyBAlM7I
         sNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187669; x=1743792469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZaBQSGCWBE4y8Yxfb/IZp7h2QC6U5lj6cYuHqPma8Y=;
        b=v3OnDTK24AmJ8t4jBKHBVrX29cvF3CPipDIOmsRkELVne8ac3ZZeuxzyk817RF2Wf9
         DtVbT78U/0HVFGr2AVnUxDubPEignMasq18qIv/KPLhLKzrI06d7tO4cfeHPVry2/GzA
         gajNKwyU7BQprEiVR8Tz/3xUUTngTuP4rwl4N8yFcKP0OwNpEO/N3+DIGcdfOiFaSZA9
         Gu6Ai/8JZ1qO0eaibjLoPQnrCnIu/HIK6ecy48bXHAJRm2uPK+RZYFsHLyTBPJGK1p/6
         +SLNzg9ZdJCnpG1KbXMvnU7CSvm91HnptxXRdBpMfYednJvjRMYkd9vPjJHuuV+Gqx3Z
         nFZA==
X-Forwarded-Encrypted: i=1; AJvYcCVpPKRMID3+/Qdwszrli5a9aAZIgjR7AkThdMF7tIVIYnYAqqgG6Pm+hMjO2EKrNAYhY3hBzDrzObmAG5XIjAKXsBAv6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxA11vpdv16Q9AKVUz31u67jqqbSkEe+uN/0cBmtGhb3hc2po5K
	FXyX8Z4mxyraP1+cpcxB0QQ2zhCTyihJSVxox0WrCBMCr1rJ2+vw0cbZYosIXk9VdI1S+Qt5fse
	LgHcfq1jAfjFhsdHd9LZ4GyrBQWY=
X-Gm-Gg: ASbGnct1REMNzKdQ8IelSXEkSC3KOGEPKnvjdwJYEuDEvPgUA7PZqfo9Y7/2f38sBmO
	4XYJabk8mVCWMVMxH10Q1J36FUipsreOgtpv9I+zuME2QnlDhbcU/7Tos0dH2GOvr4tTsBNAOzU
	TPTABxgipoGVO5OvRVVW4VgUvNGA==
X-Google-Smtp-Source: AGHT+IGged0fiKJixaESzWEycujCFhGP10Um4mqXsySmBso06gxn7OacXwS/hBBtYkJHKWSaCbjdAnUtABiTT1XdSmY=
X-Received: by 2002:a17:90b:3e8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-305321512bdmr184984a91.3.1743187668589; Fri, 28 Mar 2025
 11:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250328032942.16264-1-bold.zone2373@fastmail.com>
In-Reply-To: <20250328032942.16264-1-bold.zone2373@fastmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Mar 2025 14:47:36 -0400
X-Gm-Features: AQ5f1Jq8EA08dieD66Twx8lZwHUaFgRa-kOz_qrrVj6oWZ2bGitqfzj7vLQrjb4
Message-ID: <CADnq5_M63JAhaqoe4OndwmcQN-Sw2NOYfGsd2wgsix_LqNnnjA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: removed unused function
To: James Flowers <bold.zone2373@fastmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Thu, Mar 27, 2025 at 11:37=E2=80=AFPM James Flowers
<bold.zone2373@fastmail.com> wrote:
>
> Removed unused function mpc401_get_3dlut_fast_load_status.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h     | 17 -----------------
>  .../drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c  | 11 -----------
>  .../drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h  | 14 --------------
>  3 files changed, 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/dr=
m/amd/display/dc/inc/hw/mpc.h
> index 3a89cc0cffc1..eaef3899da7b 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -967,23 +967,6 @@ struct mpc_funcs {
>         */
>
>         void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_i=
d, int hubp_idx);
> -       /**
> -       * @get_3dlut_fast_load_status:
> -       *
> -       * Get 3D LUT fast load status and reference them with done, soft_=
underflow and hard_underflow pointers.
> -       *
> -       * Parameters:
> -       * - [in/out] mpc - MPC context.
> -       * - [in] mpcc_id
> -       * - [in/out] done
> -       * - [in/out] soft_underflow
> -       * - [in/out] hard_underflow
> -       *
> -       * Return:
> -       *
> -       * void
> -       */
> -       void (*get_3dlut_fast_load_status)(struct mpc *mpc, int mpcc_id, =
uint32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow);
>
>         /**
>         * @populate_lut:
> diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c b/dri=
vers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> index ad67197557ca..98cf0cbd59ba 100644
> --- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> @@ -47,16 +47,6 @@ void mpc401_update_3dlut_fast_load_select(struct mpc *=
mpc, int mpcc_id, int hubp
>         REG_SET(MPCC_MCM_3DLUT_FAST_LOAD_SELECT[mpcc_id], 0, MPCC_MCM_3DL=
UT_FL_SEL, hubp_idx);
>  }
>
> -void mpc401_get_3dlut_fast_load_status(struct mpc *mpc, int mpcc_id, uin=
t32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow)
> -{
> -       struct dcn401_mpc *mpc401 =3D TO_DCN401_MPC(mpc);
> -
> -       REG_GET_3(MPCC_MCM_3DLUT_FAST_LOAD_STATUS[mpcc_id],
> -                       MPCC_MCM_3DLUT_FL_DONE, done,
> -                       MPCC_MCM_3DLUT_FL_SOFT_UNDERFLOW, soft_underflow,
> -                       MPCC_MCM_3DLUT_FL_HARD_UNDERFLOW, hard_underflow)=
;
> -}
> -
>  void mpc401_set_movable_cm_location(struct mpc *mpc, enum mpcc_movable_c=
m_location location, int mpcc_id)
>  {
>         struct dcn401_mpc *mpc401 =3D TO_DCN401_MPC(mpc);
> @@ -618,7 +608,6 @@ static const struct mpc_funcs dcn401_mpc_funcs =3D {
>         .set_bg_color =3D mpc1_set_bg_color,
>         .set_movable_cm_location =3D mpc401_set_movable_cm_location,
>         .update_3dlut_fast_load_select =3D mpc401_update_3dlut_fast_load_=
select,
> -       .get_3dlut_fast_load_status =3D mpc401_get_3dlut_fast_load_status=
,
>         .populate_lut =3D mpc401_populate_lut,
>         .program_lut_read_write_control =3D mpc401_program_lut_read_write=
_control,
>         .program_lut_mode =3D mpc401_program_lut_mode,
> diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h b/dri=
vers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> index ce6fbcf14d7a..8e35ebc603a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> @@ -241,23 +241,9 @@ void mpc401_update_3dlut_fast_load_select(
>         int mpcc_id,
>         int hubp_idx);
>
> -void mpc401_get_3dlut_fast_load_status(
> -       struct mpc *mpc,
> -       int mpcc_id,
> -       uint32_t *done,
> -       uint32_t *soft_underflow,
> -       uint32_t *hard_underflow);
> -
>  void mpc401_update_3dlut_fast_load_select(
>         struct mpc *mpc,
>         int mpcc_id,
>         int hubp_idx);
>
> -void mpc401_get_3dlut_fast_load_status(
> -       struct mpc *mpc,
> -       int mpcc_id,
> -       uint32_t *done,
> -       uint32_t *soft_underflow,
> -       uint32_t *hard_underflow);
> -
>  #endif
> --
> 2.49.0
>
