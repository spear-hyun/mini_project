# Generated by Django 4.2.1 on 2023-05-15 02:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("talent", "0001_initial"),
    ]

    operations = [
        migrations.RenameField(
            model_name="cart",
            old_name="user",
            new_name="user_id",
        ),
        migrations.RenameField(
            model_name="product",
            old_name="user",
            new_name="user_id",
        ),
        migrations.RenameField(
            model_name="review",
            old_name="user",
            new_name="user_id",
        ),
        migrations.RemoveField(
            model_name="ordered",
            name="user",
        ),
        migrations.RemoveField(
            model_name="user",
            name="type",
        ),
        migrations.AddField(
            model_name="ordered",
            name="user_id",
            field=models.ForeignKey(
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="talent.user",
            ),
        ),
        migrations.AlterField(
            model_name="ordered",
            name="product",
            field=models.ForeignKey(
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="talent.product",
            ),
        ),
        migrations.AlterField(
            model_name="product",
            name="category",
            field=models.ForeignKey(
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="talent.category",
            ),
        ),
        migrations.AlterField(
            model_name="product",
            name="thumbnail_image",
            field=models.CharField(max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name="user",
            name="profile_image",
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.DeleteModel(
            name="Type",
        ),
    ]
